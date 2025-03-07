program ifdabn

integer::i,dic,dia,dib,filen,colen
real::maxc,minc,maxcalt,mincalt,piv1,piv2,prodg,sumaf,fil,col

!1)
real, allocatable:: av(:),bv(:),cv(:)
real, allocatable:: dn(:,:),en(:,:),sn(:,:)

!2)
write(*,*) 'deme la dimension de los vectores A y B'
read(*,*) dia,dib
allocate(av(dia))
allocate(bv(dib))

!3)
write(*,*) 'deme los elementos del vector A y luego los del vector B'
read(*,*) (av(i),i=1,dia)
read(*,*) (bv(i),i=1,dib)

!4)
dic=size(av)*size(bv)
allocate(cv(dic))
cv=(/av,bv/)
write(*,*) cv

!5)
!intrinsecas:
maxc=maxval(cv)
minc=minval(cv)
!alternativo (haciendo metodo de la burbuja:
piv1=c(1)
do i=1,dic
	if (c(i)<piv1) then
	piv1=c(i)
	end if
end do
maxcalt=piv1
piv2=c(1)
do i=1,dic
	if (c(i)>piv2) then
	piv2=c(i)
	end if
end do
mincalt=piv2
write(*,*) maxc,maxcalt,minc,mincalt

!6)
!intrinseca:
sumaf=sum(cv((/(i, i=2,dic,2)/)))
!alternativa:
suma=0
do i=1,dic
	if (mod(i,2).eq.0) then
		suma=suma+c(i)
	end if
end do
write(*,*) suma,sumaf

!7)
!intrinseca:
prodg=product(cv((/(i, i=1,dic,2)/)))
!alternativa:
prod=1
do i=1,dic
	if (mod(i,2).ne.0) then
		prod=prod*c(i)
	end if
end do
write(*,*) prod,prodg

!8)
deallocate(av)
deallocate(bv)
allocate(av(15))
allocate(bv(15))
av=(/ (real(i), i=1,15) /)
bv=(/ (real(i), i=16,30) /)
write(*,*) av,bv

!9)
deallocate(cv)
allocate(cv(15))
cv=sqrt(av)*sqrt(bv)
write(*,*) cv

!10)
allocate(dn(5,3))

!11)
!intrinseca

dn=reshape(av,(/5,3/))
!alternativo ¿?
write(*,*) dn

!12)
col=sum(dn(:,2))
fil=product(dn(4,:))
write(*,*) fil,col

!13)
colen=size(dn,2)
filen=size(dn,1)
allocate(en(filen,colen))
en=dn*2
write(*,*) en

!14)
deallocate(en)
allocate(en(2,3))
en=dn(3:5,2:3)
write(*,*) en

!15)
allocate(sn(1,6))
sn=reshape(en,(/1,6/))
write(*,*) sn

end program
