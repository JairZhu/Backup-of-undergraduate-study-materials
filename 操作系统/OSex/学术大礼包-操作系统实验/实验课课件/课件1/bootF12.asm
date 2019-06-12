    org  07c00h					; 加载到 0:7C00 处
	jmp short LABEL_START		; Start to boot.
	nop							; 这个 nop 不可少
	; 下面是 FAT12 磁盘引导扇区的BPB和EBPB结构区51字节
	BS_OEMName		DB 'LingOs  ' ; OEM String, 必须 8 个字节（不足补空格）
	BPB_BytsPerSec	DW 512		; 每扇区字节数
	BPB_SecPerClus	DB 1		; 每簇多少扇区
	BPB_RsvdSecCnt	DW 1		; Boot记录占用多少扇区
	BPB_NumFATs		DB 2		; 共有多少 FAT 表
	BPB_RootEntCnt	DW 224		; 根目录文件数最大值
	BPB_TotSec16	DW 2880		; 逻辑扇区总数
	BPB_Media		DB 0xF0		; 介质描述符
	BPB_FATSz16		DW 9		; 每FAT扇区数
	BPB_SecPerTrk	DW 18		; 每磁道扇区数
	BPB_NumHeads	DW 2		; 磁头数(面数)
	BPB_HiddSec		DD 0		; 隐藏扇区数
	BPB_TotSec32	DD 0		; wTotalSectorCount为0时这个值记录扇区数
	BS_DrvNum		DB 0		; 中断 13 的驱动器号
	BS_Reserved1	DB 0		; 未使用
	BS_BootSig		DB 29h		; 扩展引导标记 (29h)
	BS_VolID		DD 12345678h; 卷序列号
	BS_VolLab		DB 'LingOSv0.4' ; 卷标, 必须 11 个字节（不足补空格）
	BS_FileSysType	DB 'FAT12   '	; 文件系统类型, 必须 8个字节（不足补空格）  
LABEL_START:
	mov	ax, cs			; 置DS和ES=CS
	mov	ds, ax
	mov	es, ax
	Call	DispStr		; 调用显示字符串例程
	jmp	$				; 无限循环
DispStr:
	mov	ax, BootMessage
	mov	bp, ax			; ES:BP = 串地址
	mov	cx, 16			; CX = 串长度
	mov	ax, 01301h		; AH = 13,  AL = 01h
	mov	bx, 000ch			; 页号为0(BH = 0) 黑底红字(BL = 0Ch,高亮)
	mov	dx, 0
	int	10h				; int 10h
	ret
BootMessage:	db	"LingOSv0.4!"
	times 510-($-$$)	db	0	; 用0填充引导扇区剩下的空间
	db 	55h,0aah				; 引导扇区结束标志
; 填充两个FAT表的头两个项（每个FAT占9个扇区）
	db 0f0h, 0ffh, 0ffh			; 介质描述符（F0h）和Fh、结束簇标志项FFFh
	times 512*9-3		db	0	; 用0填充FAT#1剩下的空间
	db 0f0h, 0ffh, 0ffh			; 介质描述符（F0h）和Fh、结束簇标志项FFFh
	times 512*9-3		db	0	; 用0填充FAT#2剩下的空间
; 根目录中的卷标条目
	db 'LingOS_Disk' 			; 卷标, 必须 11 个字节（不足补空格）
	db 8						; 文件属性值（卷标条目的为08h）
	dw 0,0,0,0,0				; 10个保留字节
	dw 0,4070h				    ; 创建时间，设为2012年3月16日0时0分0秒
	dw 0						; 开始簇号（卷标条目的必需为0）
	dd 0						; 文件大小（也设为0）
