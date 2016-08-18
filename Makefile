bootsect.img: bootsect.o
	ld -Ttext=0x7c00 --oformat binary -o $@ -s $<

bootsect.o: bootsect.s
	as -o $@ $<

run: bootsect.img
	qemu -fda $<

clean:
	rm -f *.o bootsect.img
