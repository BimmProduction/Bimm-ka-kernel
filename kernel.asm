[bits 32]
[global _start]
[extern main]

section .multiboot
align 4
    dd 0x1BADB002
    dd 0x00000003
    dd -(0x1BADB002 + 0x00000003)

section .text
_start:
    mov esp, stack_top
    push eax
    push ebx
    call main
    cli
    hlt
    jmp $

global gdt_flush
gdt_flush:
    mov eax, [esp + 4]
    lgdt [eax]
    mov ax, 0x10
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    mov ss, ax
    jmp 0x08:.flush
.flush:
    ret

global idt_flush
idt_flush:
    mov eax, [esp + 4]
    lidt [eax]
    ret

global tss_flush
tss_flush:
    mov ax, 0x2B
    ltr ax
    ret

global isr0
global isr1
global isr2
global isr3
global isr4
global isr5
global isr6
global isr7
global isr8
global isr9
global isr10
global isr11
global isr12
global isr13
global isr14
global isr15
global isr16
global isr17
global isr18
global isr19
global isr20
global isr21
global isr22
global isr23
global isr24
global isr25
global isr26
global isr27
global isr28
global isr29
global isr30
global isr31
global irq0
global irq1
global irq2
global irq3
global irq4
global irq5
global irq6
global irq7
global irq8
global irq9
global irq10
global irq11
global irq12
global irq13
global irq14
global irq15

isr0:
    cli
    push byte 0
    push byte 0
    jmp isr_common_stub

isr1:
    cli
    push byte 0
    push byte 1
    jmp isr_common_stub

isr2:
    cli
    push byte 0
    push byte 2
    jmp isr_common_stub

isr3:
    cli
    push byte 0
    push byte 3
    jmp isr_common_stub

isr4:
    cli
    push byte 0
    push byte 4
    jmp isr_common_stub

isr5:
    cli
    push byte 0
    push byte 5
    jmp isr_common_stub

isr6:
    cli
    push byte 0
    push byte 6
    jmp isr_common_stub

isr7:
    cli
    push byte 0
    push byte 7
    jmp isr_common_stub

isr8:
    cli
    push byte 8
    jmp isr_common_stub

isr9:
    cli
    push byte 0
    push byte 9
    jmp isr_common_stub

isr10:
    cli
    push byte 10
    jmp isr_common_stub

isr11:
    cli
    push byte 11
    jmp isr_common_stub

isr12:
    cli
    push byte 12
    jmp isr_common_stub

isr13:
    cli
    push byte 13
    jmp isr_common_stub

isr14:
    cli
    push byte 14
    jmp isr_common_stub

isr15:
    cli
    push byte 0
    push byte 15
    jmp isr_common_stub

isr16:
    cli
    push byte 0
    push byte 16
    jmp isr_common_stub

isr17:
    cli
    push byte 0
    push byte 17
    jmp isr_common_stub

isr18:
    cli
    push byte 0
    push byte 18
    jmp isr_common_stub

isr19:
    cli
    push byte 0
    push byte 19
    jmp isr_common_stub

isr20:
    cli
    push byte 0
    push byte 20
    jmp isr_common_stub

isr21:
    cli
    push byte 0
    push byte 21
    jmp isr_common_stub

isr22:
    cli
    push byte 0
    push byte 22
    jmp isr_common_stub

isr23:
    cli
    push byte 0
    push byte 23
    jmp isr_common_stub

isr24:
    cli
    push byte 0
    push byte 24
    jmp isr_common_stub

isr25:
    cli
    push byte 0
    push byte 25
    jmp isr_common_stub

isr26:
    cli
    push byte 0
    push byte 26
    jmp isr_common_stub

isr27:
    cli
    push byte 0
    push byte 27
    jmp isr_common_stub

isr28:
    cli
    push byte 0
    push byte 28
    jmp isr_common_stub

isr29:
    cli
    push byte 0
    push byte 29
    jmp isr_common_stub

isr30:
    cli
    push byte 0
    push byte 30
    jmp isr_common_stub

isr31:
    cli
    push byte 0
    push byte 31
    jmp isr_common_stub

irq0:
    cli
    push byte 0
    push byte 32
    jmp irq_common_stub

irq1:
    cli
    push byte 0
    push byte 33
    jmp irq_common_stub

irq2:
    cli
    push byte 0
    push byte 34
    jmp irq_common_stub

irq3:
    cli
    push byte 0
    push byte 35
    jmp irq_common_stub

irq4:
    cli
    push byte 0
    push byte 36
    jmp irq_common_stub

irq5:
    cli
    push byte 0
    push byte 37
    jmp irq_common_stub

irq6:
    cli
    push byte 0
    push byte 38
    jmp irq_common_stub

irq7:
    cli
    push byte 0
    push byte 39
    jmp irq_common_stub

irq8:
    cli
    push byte 0
    push byte 40
    jmp irq_common_stub

irq9:
    cli
    push byte 0
    push byte 41
    jmp irq_common_stub

irq10:
    cli
    push byte 0
    push byte 42
    jmp irq_common_stub

irq11:
    cli
    push byte 0
    push byte 43
    jmp irq_common_stub

irq12:
    cli
    push byte 0
    push byte 44
    jmp irq_common_stub

irq13:
    cli
    push byte 0
    push byte 45
    jmp irq_common_stub

irq14:
    cli
    push byte 0
    push byte 46
    jmp irq_common_stub

irq15:
    cli
    push byte 0
    push byte 47
    jmp irq_common_stub

isr_common_stub:
    pusha
    push ds
    push es
    push fs
    push gs
    mov ax, 0x10
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    mov eax, esp
    push eax
    mov eax, isr_handler
    call eax
    pop eax
    pop gs
    pop fs
    pop es
    pop ds
    popa
    add esp, 8
    iret

irq_common_stub:
    pusha
    push ds
    push es
    push fs
    push gs
    mov ax, 0x10
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    mov eax, esp
    push eax
    mov eax, irq_handler
    call eax
    pop eax
    pop gs
    pop fs
    pop es
    pop ds
    popa
    add esp, 8
    iret

global outb
outb:
    mov dx, [esp + 4]
    mov al, [esp + 8]
    out dx, al
    ret

global inb
inb:
    mov dx, [esp + 4]
    in al, dx
    ret

global outw
outw:
    mov dx, [esp + 4]
    mov ax, [esp + 8]
    out dx, ax
    ret

global inw
inw:
    mov dx, [esp + 4]
    in ax, dx
    ret

global outl
outl:
    mov dx, [esp + 4]
    mov eax, [esp + 8]
    out dx, eax
    ret

global inl
inl:
    mov dx, [esp + 4]
    in eax, dx
    ret

global io_wait
io_wait:
    mov dx, 0x80
    out dx, al
    ret

global enable_interrupts
enable_interrupts:
    sti
    ret

global disable_interrupts
disable_interrupts:
    cli
    ret

global read_cr0
read_cr0:
    mov eax, cr0
    ret

global write_cr0
write_cr0:
    mov eax, [esp + 4]
    mov cr0, eax
    ret

global read_cr2
read_cr2:
    mov eax, cr2
    ret

global read_cr3
read_cr3:
    mov eax, cr3
    ret

global write_cr3
write_cr3:
    mov eax, [esp + 4]
    mov cr3, eax
    ret

global read_cr4
read_cr4:
    mov eax, cr4
    ret

global write_cr4
write_cr4:
    mov eax, [esp + 4]
    mov cr4, eax
    ret

global read_msr
read_msr:
    mov ecx, [esp + 4]
    rdmsr
    ret

global write_msr
write_msr:
    mov ecx, [esp + 4]
    mov eax, [esp + 8]
    mov edx, [esp + 12]
    wrmsr
    ret

global cpuid_check
cpuid_check:
    push ebx
    mov eax, [esp + 8]
    mov ecx, [esp + 12]
    cpuid
    mov edi, [esp + 16]
    mov [edi], eax
    mov edi, [esp + 20]
    mov [edi], ebx
    mov edi, [esp + 24]
    mov [edi], ecx
    mov edi, [esp + 28]
    mov [edi], edx
    pop ebx
    ret

global invalidate_page
invalidate_page:
    mov eax, [esp + 4]
    invlpg [eax]
    ret

global load_tr
load_tr:
    ltr [esp + 4]
    ret

global switch_to_user_mode
switch_to_user_mode:
    cli
    mov ax, 0x23
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    push 0x23
    push esp
    pushf
    push 0x1B
    push user_mode_entry
    iret
user_mode_entry:
    ret

global get_eflags
get_eflags:
    pushf
    pop eax
    ret

global set_eflags
set_eflags:
    push dword [esp + 4]
    popf
    ret

global spinlock_acquire
spinlock_acquire:
    mov eax, [esp + 4]
.spin_loop:
    lock bts dword [eax], 0
    jc .spin_pause
    ret
.spin_pause:
    pause
    jmp .spin_loop

global spinlock_release
spinlock_release:
    mov eax, [esp + 4]
    lock btr dword [eax], 0
    ret

global atomic_add
atomic_add:
    mov eax, [esp + 4]
    mov ecx, [esp + 8]
    lock xadd [eax], ecx
    mov eax, ecx
    ret

global atomic_sub
atomic_sub:
    mov eax, [esp + 4]
    mov ecx, [esp + 8]
    neg ecx
    lock xadd [eax], ecx
    mov eax, ecx
    neg eax
    ret

global atomic_inc
atomic_inc:
    mov eax, [esp + 4]
    lock inc dword [eax]
    ret

global atomic_dec
atomic_dec:
    mov eax, [esp + 4]
    lock dec dword [eax]
    ret

global cmos_read
cmos_read:
    mov al, [esp + 4]
    out 0x70, al
    in al, 0x71
    ret

global cmos_write
cmos_write:
    mov al, [esp + 4]
    out 0x70, al
    mov al, [esp + 8]
    out 0x71, al
    ret

global reboot
reboot:
    mov al, 0xFE
    out 0x64, al
    ret

global shutdown_qemu
shutdown_qemu:
    mov dx, 0x604
    mov ax, 0x2000
    out dx, ax
    ret

global hang
hang:
    cli
    hlt
    jmp hang

global memset
memset:
    push edi
    mov edi, [esp + 8]
    mov eax, [esp + 12]
    mov ecx, [esp + 16]
    rep stosb
    pop edi
    ret

global memcpy
memcpy:
    push esi
    push edi
    mov esi, [esp + 12]
    mov edi, [esp + 16]
    mov ecx, [esp + 20]
    rep movsb
    pop edi
    pop esi
    ret

global memmove
memmove:
    push esi
    push edi
    mov esi, [esp + 12]
    mov edi, [esp + 16]
    mov ecx, [esp + 20]
    cmp esi, edi
    jb .backward
    rep movsb
    jmp .done
.backward:
    add esi, ecx
    dec esi
    add edi, ecx
    dec edi
    std
    rep movsb
    cld
.done:
    pop edi
    pop esi
    ret

global memcmp
memcmp:
    push esi
    push edi
    mov esi, [esp + 12]
    mov edi, [esp + 16]
    mov ecx, [esp + 20]
    repe cmpsb
    je .equal
    mov eax, 1
    jmp .done
.equal:
    xor eax, eax
.done:
    pop edi
    pop esi
    ret

global strlen
strlen:
    mov eax, [esp + 4]
    xor ecx, ecx
.str_loop:
    cmp byte [eax + ecx], 0
    je .str_done
    inc ecx
    jmp .str_loop
.str_done:
    mov eax, ecx
    ret

global strcpy
strcpy:
    push esi
    push edi
    mov edi, [esp + 12]
    mov esi, [esp + 16]
.strcpy_loop:
    mov al, [esi]
    mov [edi], al
    inc esi
    inc edi
    test al, al
    jnz .strcpy_loop
    pop edi
    pop esi
    ret

global strncpy
strncpy:
    push esi
    push edi
    mov edi, [esp + 12]
    mov esi, [esp + 16]
    mov ecx, [esp + 20]
.strncpy_loop:
    test ecx, ecx
    jz .strncpy_done
    mov al, [esi]
    mov [edi], al
    inc esi
    inc edi
    dec ecx
    test al, al
    jnz .strncpy_loop
.strncpy_done:
    pop edi
    pop esi
    ret

global strcmp
strcmp:
    push esi
    push edi
    mov esi, [esp + 12]
    mov edi, [esp + 16]
.strcmp_loop:
    mov al, [esi]
    mov bl, [edi]
    cmp al, bl
    jne .strcmp_diff
    test al, al
    jz .strcmp_equal
    inc esi
    inc edi
    jmp .strcmp_loop
.strcmp_equal:
    xor eax, eax
    jmp .strcmp_done
.strcmp_diff:
    sub eax, ebx
.strcmp_done:
    pop edi
    pop esi
    ret

global strncmp
strncmp:
    push esi
    push edi
    mov esi, [esp + 12]
    mov edi, [esp + 16]
    mov ecx, [esp + 20]
.strncmp_loop:
    test ecx, ecx
    jz .strncmp_equal
    mov al, [esi]
    mov bl, [edi]
    cmp al, bl
    jne .strncmp_diff
    test al, al
    jz .strncmp_equal
    inc esi
    inc edi
    dec ecx
    jmp .strncmp_loop
.strncmp_equal:
    xor eax, eax
    jmp .strncmp_done
.strncmp_diff:
    sub eax, ebx
.strncmp_done:
    pop edi
    pop esi
    ret

global strchr
strchr:
    mov eax, [esp + 4]
    mov ecx, [esp + 8]
.strchr_loop:
    cmp byte [eax], cl
    je .strchr_found
    cmp byte [eax], 0
    je .strchr_not_found
    inc eax
    jmp .strchr_loop
.strchr_found:
    ret
.strchr_not_found:
    xor eax, eax
    ret

global strrchr
strrchr:
    mov eax, [esp + 4]
    mov ecx, [esp + 8]
    xor edx, edx
.strrchr_loop:
    cmp byte [eax], cl
    jne .strrchr_not_match
    mov edx, eax
.strrchr_not_match:
    cmp byte [eax], 0
    je .strrchr_done
    inc eax
    jmp .strrchr_loop
.strrchr_done:
    mov eax, edx
    ret

global strstr
strstr:
    push ebx
    push edx
    mov eax, [esp + 12]
    mov ebx, [esp + 16]
    cmp byte [ebx], 0
    jne .strstr_search
    pop edx
    pop ebx
    ret
.strstr_search:
    mov edx, eax
.strstr_outer:
    mov eax, edx
    mov ecx, ebx
.strstr_inner:
    cmp byte [ecx], 0
    je .strstr_found
    cmp byte [eax], 0
    je .strstr_not_found
    mov bl, [ecx]
    cmp [eax], bl
    jne .strstr_next
    inc eax
    inc ecx
    jmp .strstr_inner
.strstr_next:
    inc edx
    jmp .strstr_outer
.strstr_found:
    mov eax, edx
    pop edx
    pop ebx
    ret
.strstr_not_found:
    xor eax, eax
    pop edx
    pop ebx
    ret

global atoi
atoi:
    mov eax, [esp + 4]
    xor ecx, ecx
    xor edx, edx
.atoi_loop:
    mov dl, [eax]
    cmp dl, '0'
    jb .atoi_done
    cmp dl, '9'
    ja .atoi_done
    sub dl, '0'
    imul ecx, 10
    add ecx, edx
    inc eax
    jmp .atoi_loop
.atoi_done:
    mov eax, ecx
    ret

global itoa
itoa:
    push ebx
    push edi
    mov eax, [esp + 12]
    mov edi, [esp + 16]
    mov ebx, [esp + 20]
    test eax, eax
    jnz .itoa_convert
    mov byte [edi], '0'
    mov byte [edi + 1], 0
    jmp .itoa_done
.itoa_convert:
    push edi
    mov ecx, 0
.itoa_div:
    xor edx, edx
    div ebx
    push dx
    inc ecx
    test eax, eax
    jnz .itoa_div
.itoa_pop:
    pop dx
    cmp dl, 9
    jbe .itoa_digit
    add dl, 'A' - 10
    jmp .itoa_store
.itoa_digit:
    add dl, '0'
.itoa_store:
    mov [edi], dl
    inc edi
    loop .itoa_pop
    mov byte [edi], 0
.itoa_done:
    pop edi
    pop ebx
    ret

global rand
rand:
    mov eax, [rand_seed]
    mov ecx, 1103515245
    mul ecx
    add eax, 12345
    mov [rand_seed], eax
    shr eax, 16
    and eax, 0x7FFF
    ret

global srand
srand:
    mov eax, [esp + 4]
    mov [rand_seed], eax
    ret

global sqrt
sqrt:
    fild dword [esp + 4]
    fsqrt
    fistp dword [esp + 4]
    mov eax, [esp + 4]
    ret

global abs_value
abs_value:
    mov eax, [esp + 4]
    test eax, eax
    jns .abs_done
    neg eax
.abs_done:
    ret

global min
min:
    mov eax, [esp + 4]
    mov ecx, [esp + 8]
    cmp eax, ecx
    jle .min_done
    mov eax, ecx
.min_done:
    ret

global max
max:
    mov eax, [esp + 4]
    mov ecx, [esp + 8]
    cmp eax, ecx
    jge .max_done
    mov eax, ecx
.max_done:
    ret

global swap_bytes
swap_bytes:
    mov eax, [esp + 4]
    mov ecx, eax
    and eax, 0xFF00FF00
    shr eax, 8
    and ecx, 0x00FF00FF
    shl ecx, 8
    or eax, ecx
    ret

global bswap32
bswap32:
    mov eax, [esp + 4]
    bswap eax
    ret

global bswap16
bswap16:
    mov eax, [esp + 4]
    xchg al, ah
    ret

global is_aligned
is_aligned:
    mov eax, [esp + 4]
    mov ecx, [esp + 8]
    xor edx, edx
    div ecx
    test edx, edx
    setz al
    movzx eax, al
    ret

global align_up
align_up:
    mov eax, [esp + 4]
    mov ecx, [esp + 8]
    add eax, ecx
    dec eax
    xor edx, edx
    div ecx
    mul ecx
    ret

global align_down
align_down:
    mov eax, [esp + 4]
    mov ecx, [esp + 8]
    xor edx, edx
    div ecx
    mul ecx
    ret

global fpu_init
fpu_init:
    fninit
    ret

global fpu_save
fpu_save:
    mov eax, [esp + 4]
    fnsave [eax]
    ret

global fpu_restore
fpu_restore:
    mov eax, [esp + 4]
    frstor [eax]
    ret

global sse_init
sse_init:
    mov eax, cr0
    and ax, 0xFFFB
    or ax, 0x0002
    mov cr0, eax
    mov eax, cr4
    or ax, 0x0600
    mov cr4, eax
    ret

global sse_save
sse_save:
    mov eax, [esp + 4]
    fxsave [eax]
    ret

global sse_restore
sse_restore:
    mov eax, [esp + 4]
    fxrstor [eax]
    ret

global rdtsc
rdtsc:
    rdtsc
    ret

global rdpmc
rdpmc:
    mov ecx, [esp + 4]
    rdpmc
    ret

global invd
invd:
    invd
    ret

global wbinvd
wbinvd:
    wbinvd
    ret

global clflush
clflush:
    mov eax, [esp + 4]
    clflush [eax]
    ret

global mfence
mfence:
    mfence
    ret

global lfence
lfence:
    lfence
    ret

global sfence
sfence:
    sfence
    ret

global xsave
xsave:
    mov eax, [esp + 4]
    mov edx, [esp + 8]
    xsave [eax]
    ret

global xrstor
xrstor:
    mov eax, [esp + 4]
    mov edx, [esp + 8]
    xrstor [eax]
    ret

global xgetbv
xgetbv:
    mov ecx, [esp + 4]
    xgetbv
    ret

global xsetbv
xsetbv:
    mov ecx, [esp + 4]
    mov eax, [esp + 8]
    mov edx, [esp + 12]
    xsetbv
    ret

global vmcall
vmcall:
    vmcall
    ret

global vmlaunch
vmlaunch:
    vmlaunch
    ret

global vmresume
vmresume:
    vmresume
    ret

global vmxoff
vmxoff:
    vmxoff
    ret

global vmxon
vmxon:
    mov eax, [esp + 4]
    vmxon [eax]
    ret

global vmptrld
vmptrld:
    mov eax, [esp + 4]
    vmptrld [eax]
    ret

global vmptrst
vmptrst:
    mov eax, [esp + 4]
    vmptrst [eax]
    ret

global vmclear
vmclear:
    mov eax, [esp + 4]
    vmclear [eax]
    ret

global vmread
vmread:
    mov eax, [esp + 4]
    vmread [esp + 8], eax
    ret

global vmwrite
vmwrite:
    mov eax, [esp + 4]
    mov ecx, [esp + 8]
    vmwrite eax, ecx
    ret

global monitor
monitor:
    mov eax, [esp + 4]
    mov ecx, [esp + 8]
    mov edx, [esp + 12]
    monitor eax, ecx, edx
    ret

global mwait
mwait:
    mov eax, [esp + 4]
    mov ecx, [esp + 8]
    mwait eax, ecx
    ret

global pause
pause:
    pause
    ret

global nop
nop:
    nop
    ret

global debug_break
debug_break:
    int3
    ret

global enable_pse
enable_pse:
    mov eax, cr4
    or eax, 0x00000010
    mov cr4, eax
    ret

global enable_pae
enable_pae:
    mov eax, cr4
    or eax, 0x00000020
    mov cr4, eax
    ret

global enable_pge
enable_pge:
    mov eax, cr4
    or eax, 0x00000080
    mov cr4, eax
    ret

global enable_nx
enable_nx:
    mov ecx, 0xC0000080
    rdmsr
    or eax, 0x00000800
    wrmsr
    ret

global enable_syscall
enable_syscall:
    mov ecx, 0xC0000080
    rdmsr
    or eax, 0x00000001
    wrmsr
    ret

global syscall_entry
syscall_entry:
    ret

global syscall_handler
syscall_handler:
    ret

global sysenter_entry
sysenter_entry:
    ret

global syscall_handler_32
syscall_handler_32:
    ret

global set_syscall_msr
set_syscall_msr:
    ret

global set_sysenter_msr
set_sysenter_msr:
    ret

global pic_remap
pic_remap:
    push eax
    push ebx
    mov al, 0x11
    out 0x20, al
    out 0xA0, al
    mov al, 0x20
    out 0x21, al
    mov al, 0x28
    out 0xA1, al
    mov al, 0x04
    out 0x21, al
    mov al, 0x02
    out 0xA1, al
    mov al, 0x01
    out 0x21, al
    out 0xA1, al
    mov al, 0xFF
    out 0x21, al
    out 0xA1, al
    pop ebx
    pop eax
    ret

global pic_mask
pic_mask:
    mov ax, [esp + 4]
    out 0x21, al
    mov al, ah
    out 0xA1, al
    ret

global pic_disable
pic_disable:
    mov al, 0xFF
    out 0x21, al
    out 0xA1, al
    ret

global pic_eoi
pic_eoi:
    mov al, 0x20
    out 0x20, al
    ret

global pic_eoi_slave
pic_eoi_slave:
    mov al, 0x20
    out 0xA0, al
    out 0x20, al
    ret

global pit_init
pit_init:
    push eax
    push ebx
    mov ebx, [esp + 12]
    mov al, 0x34
    out 0x43, al
    mov al, bl
    out 0x40, al
    mov al, bh
    out 0x40, al
    pop ebx
    pop eax
    ret

global pit_set_frequency
pit_set_frequency:
    push eax
    push ebx
    mov ebx, 1193180
    mov eax, [esp + 12]
    xor edx, edx
    div eax
    mov ebx, eax
    mov al, 0x36
    out 0x43, al
    mov al, bl
    out 0x40, al
    mov al, bh
    out 0x40, al
    pop ebx
    pop eax
    ret

global rtc_get_seconds
rtc_get_seconds:
    mov al, 0x00
    out 0x70, al
    in al, 0x71
    ret

global rtc_get_minutes
rtc_get_minutes:
    mov al, 0x02
    out 0x70, al
    in al, 0x71
    ret

global rtc_get_hours
rtc_get_hours:
    mov al, 0x04
    out 0x70, al
    in al, 0x71
    ret

global rtc_get_day
rtc_get_day:
    mov al, 0x07
    out 0x70, al
    in al, 0x71
    ret

global rtc_get_month
rtc_get_month:
    mov al, 0x08
    out 0x70, al
    in al, 0x71
    ret

global rtc_get_year
rtc_get_year:
    mov al, 0x09
    out 0x70, al
    in al, 0x71
    ret

global keyboard_read
keyboard_read:
    in al, 0x60
    ret

global keyboard_status
keyboard_status:
    in al, 0x64
    ret

global keyboard_leds
keyboard_leds:
    mov al, [esp + 4]
    out 0x60, al
    ret

global mouse_read
mouse_read:
    in al, 0x60
    ret

global mouse_write
mouse_write:
    mov al, [esp + 4]
    out 0x60, al
    ret

global mouse_wait
mouse_wait:
    in al, 0x64
    test al, 0x02
    jnz mouse_wait
    ret

global vga_set_cursor
vga_set_cursor:
    push eax
    push edx
    mov edx, 0x03D4
    mov al, 0x0E
    out dx, al
    inc edx
    mov eax, [esp + 12]
    shr eax, 8
    out dx, al
    dec edx
    mov al, 0x0F
    out dx, al
    inc edx
    mov eax, [esp + 12]
    out dx, al
    pop edx
    pop eax
    ret

global vga_get_cursor
vga_get_cursor:
    push edx
    mov edx, 0x03D4
    mov al, 0x0E
    out dx, al
    inc edx
    in al, dx
    mov ah, al
    dec edx
    mov al, 0x0F
    out dx, al
    inc edx
    in al, dx
    shl eax, 16
    pop edx
    ret

global vga_putchar
vga_putchar:
    push ebx
    push edx
    mov ebx, [0xB8000]
    mov edx, [cursor_pos]
    shl edx, 1
    mov al, [esp + 12]
    mov ah, [esp + 16]
    mov [ebx + edx], ax
    inc dword [cursor_pos]
    pop edx
    pop ebx
    ret

global vga_clear
vga_clear:
    push eax
    push ecx
    push edi
    mov edi, 0xB8000
    mov eax, 0x07200720
    mov ecx, 2000
    rep stosd
    mov dword [cursor_pos], 0
    pop edi
    pop ecx
    pop eax
    ret

global vga_scroll
vga_scroll:
    push esi
    push edi
    push ecx
    mov esi, 0xB80A0
    mov edi, 0xB8000
    mov ecx, 1920
    rep movsd
    mov edi, 0xB8F00
    mov eax, 0x07200720
    mov ecx, 80
    rep stosd
    pop ecx
    pop edi
    pop esi
    ret

global vga_write_string
vga_write_string:
    push esi
    push ebx
    mov esi, [esp + 12]
    mov ebx, [cursor_pos]
    shl ebx, 1
    add ebx, 0xB8000
.vga_loop:
    lodsb
    test al, al
    jz .vga_done
    mov ah, [esp + 16]
    mov [ebx], ax
    add ebx, 2
    inc dword [cursor_pos]
    jmp .vga_loop
.vga_done:
    pop ebx
    pop esi
    ret

global serial_init
serial_init:
    push eax
    push edx
    mov dx, [esp + 12]
    add dx, 3
    mov al, 0x80
    out dx, al
    sub dx, 2
    mov al, 0x01
    out dx, al
    add dx, 3
    mov al, 0x03
    out dx, al
    sub dx, 2
    mov al, 0xC7
    out dx, al
    add dx, 3
    mov al, 0x0B
    out dx, al
    pop edx
    pop eax
    ret

global serial_write
serial_write:
    push edx
    mov dx, [esp + 8]
    add dx, 5
.serial_wait_write:
    in al, dx
    test al, 0x20
    jz .serial_wait_write
    sub dx, 5
    mov al, [esp + 12]
    out dx, al
    pop edx
    ret

global serial_read
serial_read:
    push edx
    mov dx, [esp + 8]
    add dx, 5
.serial_wait_read:
    in al, dx
    test al, 0x01
    jz .serial_wait_read
    sub dx, 5
    in al, dx
    pop edx
    ret

global ide_read_sector
ide_read_sector:
    push ebp
    mov ebp, esp
    push eax
    push edx
    push ecx
    mov edx, 0x1F6
    mov eax, [ebp + 12]
    and eax, 0x0F
    or eax, 0xE0
    out dx, al
    mov edx, 0x1F2
    mov al, 1
    out dx, al
    mov edx, 0x1F3
    mov eax, [ebp + 8]
    out dx, al
    inc edx
    mov al, ah
    out dx, al
    inc edx
    shr eax, 16
    out dx, al
    mov edx, 0x1F7
    mov al, 0x20
    out dx, al
.ide_wait_read:
    in al, dx
    test al, 0x08
    jz .ide_wait_read
    mov ecx, 256
    mov edx, 0x1F0
    mov edi, [ebp + 16]
    rep insw
    pop ecx
    pop edx
    pop eax
    pop ebp
    ret

global ide_write_sector
ide_write_sector:
    push ebp
    mov ebp, esp
    push eax
    push edx
    push ecx
    mov edx, 0x1F6
    mov eax, [ebp + 12]
    and eax, 0x0F
    or eax, 0xE0
    out dx, al
    mov edx, 0x1F2
    mov al, 1
    out dx, al
    mov edx, 0x1F3
    mov eax, [ebp + 8]
    out dx, al
    inc edx
    mov al, ah
    out dx, al
    inc edx
    shr eax, 16
    out dx, al
    mov edx, 0x1F7
    mov al, 0x30
    out dx, al
.ide_wait_write:
    in al, dx
    test al, 0x08
    jz .ide_wait_write
    mov ecx, 256
    mov edx, 0x1F0
    mov esi, [ebp + 16]
    rep outsw
    pop ecx
    pop edx
    pop eax
    pop ebp
    ret

global pci_read_config
pci_read_config:
    push ebp
    mov ebp, esp
    push eax
    push ebx
    push ecx
    push edx
    mov eax, [ebp + 8]
    mov ebx, [ebp + 12]
    mov ecx, [ebp + 16]
    mov edx, [ebp + 20]
    shl eax, 16
    or eax, ebx
    shl eax, 11
    or eax, ecx
    shl eax, 2
    or eax, 0x80000000
    or eax, edx
    mov edx, 0xCF8
    out dx, eax
    mov edx, 0xCFC
    in eax, dx
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret

global pci_write_config
pci_write_config:
    push ebp
    mov ebp, esp
    push eax
    push ebx
    push ecx
    push edx
    mov eax, [ebp + 8]
    mov ebx, [ebp + 12]
    mov ecx, [ebp + 16]
    mov edx, [ebp + 20]
    shl eax, 16
    or eax, ebx
    shl eax, 11
    or eax, ecx
    shl eax, 2
    or eax, 0x80000000
    or eax, edx
    mov edx, 0xCF8
    out dx, eax
    mov edx, 0xCFC
    mov eax, [ebp + 24]
    out dx, eax
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret

global apic_init
apic_init:
    ret

global apic_eoi
apic_eoi:
    mov dword [0xFEE000B0], 0
    ret

global apic_timer_init
apic_timer_init:
    ret

global ioapic_init
ioapic_init:
    ret

global smp_init
smp_init:
    ret

global acpi_init
acpi_init:
    ret

global paging_init
paging_init:
    ret

global page_fault_handler
page_fault_handler:
    push ebp
    mov ebp, esp
    mov eax, cr2
    pop ebp
    ret

global double_fault_handler
double_fault_handler:
    cli
    hlt
    jmp double_fault_handler

global gpf_handler
gpf_handler:
    cli
    hlt
    jmp gpf_handler

global kbd_handler
kbd_handler:
    push eax
    in al, 0x60
    mov [key_buffer], al
    mov al, 0x20
    out 0x20, al
    pop eax
    iret

global timer_handler
timer_handler:
    push eax
    inc dword [timer_ticks]
    mov al, 0x20
    out 0x20, al
    pop eax
    iret

global syscall_init
syscall_init:
    ret

global task_switch
task_switch:
    push ebp
    mov ebp, esp
    push eax
    mov eax, [ebp + 8]
    mov [current_task], eax
    mov esp, [eax + 4]
    pop eax
    pop ebp
    ret

global task_create
task_create:
    push ebp
    mov ebp, esp
    push ebx
    push esi
    push edi
    mov eax, [ebp + 8]
    mov ebx, [ebp + 12]
    mov [eax + 0], ebx
    mov dword [eax + 4], 0
    mov dword [eax + 8], 0
    mov dword [eax + 12], 0
    mov dword [eax + 16], 0
    mov dword [eax + 20], 0x202
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret

global schedule
schedule:
    push eax
    push ebx
    mov eax, [current_task]
    add eax, 64
    mov ebx, [task_list]
    cmp eax, ebx
    jb .next_task
    mov eax, [task_list]
.next_task:
    mov [current_task], eax
    pop ebx
    pop eax
    ret

global yield
yield:
    int 0x30
    ret

global semaphore_init
semaphore_init:
    mov eax, [esp + 4]
    mov ecx, [esp + 8]
    mov [eax], ecx
    ret

global semaphore_wait
semaphore_wait:
    mov eax, [esp + 4]
.sem_loop:
    lock dec dword [eax]
    jns .sem_acquired
    lock inc dword [eax]
    pause
    jmp .sem_loop
.sem_acquired:
    ret

global semaphore_signal
semaphore_signal:
    mov eax, [esp + 4]
    lock inc dword [eax]
    ret

global mutex_init
mutex_init:
    mov eax, [esp + 4]
    mov dword [eax], 0
    ret

global mutex_lock
mutex_lock:
    mov eax, [esp + 4]
.mutex_loop:
    lock bts dword [eax], 0
    jc .mutex_pause
    ret
.mutex_pause:
    pause
    jmp .mutex_loop

global mutex_unlock
mutex_unlock:
    mov eax, [esp + 4]
    lock btr dword [eax], 0
    ret

global spinlock_init
spinlock_init:
    mov eax, [esp + 4]
    mov dword [eax], 0
    ret

global kmalloc
kmalloc:
    push ebx
    mov eax, [esp + 8]
    mov ebx, [heap_start]
    add [heap_start], eax
    mov eax, ebx
    pop ebx
    ret

global kfree
kfree:
    ret

global heap_init
heap_init:
    mov eax, [esp + 4]
    mov [heap_start], eax
    ret

global vmm_init
vmm_init:
    ret

global pmm_init
pmm_init:
    ret

global pmm_alloc
pmm_alloc:
    ret

global pmm_free
pmm_free:
    ret

global elf_load
elf_load:
    ret

global module_load
module_load:
    ret

global exec
exec:
    ret

global fork
fork:
    ret

global exit
exit:
    cli
    hlt
    jmp exit

global wait
wait.empty_label:
    ret

global kill
kill:
    ret

global sleep
sleep:
    push ebx
    mov ebx, [esp + 8]
    add ebx, [timer_ticks]
.sleep_loop:
    hlt
    cmp [timer_ticks], ebx
    jb .sleep_loop
    pop ebx
    ret

global getpid
getpid:
    mov eax, [current_task]
    mov eax, [eax + 0]
    ret

global getppid
getppid:
    mov eax, [current_task]
    mov eax, [eax + 8]
    ret

global getuid
getuid:
    mov eax, 0
    ret

global getgid
getgid:
    mov eax, 0
    ret

global setuid
setuid:
    ret

global setgid
setgid:
    ret

global chroot
chroot:
    ret

global mount
mount:
    ret

global umount
umount:
    ret

global open
open:
    ret

global close
close:
    ret

global read
read:
    ret

global write
write:
    ret

global seek
seek:
    ret

global tell
tell:
    ret

global stat
stat:
    ret

global mkdir
mkdir:
    ret

global rmdir
rmdir:
    ret

global unlink
unlink:
    ret

global rename
rename:
    ret

global chdir
chdir:
    ret

global getcwd
getcwd:
    ret

global opendir
opendir:
    ret

global readdir
readdir:
    ret

global closedir
closedir:
    ret

global pipe
pipe:
    ret

global dup
dup:
    ret

global dup2
dup2:
    ret

global fcntl
fcntl:
    ret

global ioctl
ioctl:
    ret

global socket
socket:
    ret

global bind
bind:
    ret

global listen
listen:
    ret

global accept
accept:
    ret

global connect
connect:
    ret

global send
send:
    ret

global recv
recv:
    ret

global sendto
sendto:
    ret

global recvfrom
recvfrom:
    ret

global shutdown
shutdown:
    ret

global gethostbyname
gethostbyname:
    ret

global sethostname
sethostname:
    ret

global gettimeofday
gettimeofday:
    ret

global settimeofday
settimeofday:
    ret

global clock_gettime
clock_gettime:
    ret

global clock_settime
clock_settime:
    ret

global nanosleep
nanosleep:
    ret

global timer_create
timer_create:
    ret

global timer_delete
timer_delete:
    ret

global timer_settime
timer_settime:
    ret

global timer_gettime
timer_gettime:
    ret

global sigaction
sigaction:
    ret

global sigprocmask
sigprocmask:
    ret

global sigpending
sigpending:
    ret

global sigsuspend
sigsuspend:
    ret

global kill_pid
kill_pid:
    ret

global raise
raise:
    ret

global alarm
alarm:
    ret

global mmap
mmap:
    ret

global munmap
munmap:
    ret

global mprotect
mprotect:
    ret

global msync
msync:
    ret

global mlock
mlock:
    ret

global munlock
munlock:
    ret

global shm_open
shm_open:
    ret

global shm_unlink
shm_unlink:
    ret

global sem_open
sem_open:
    ret

global sem_close
sem_close:
    ret

global sem_unlink
sem_unlink:
    ret

global sem_wait
sem_wait:
    ret

global sem_trywait
sem_trywait:
    ret

global sem_timedwait
sem_timedwait:
    ret

global sem_post
sem_post:
    ret

global sem_getvalue
sem_getvalue:
    ret

global msgget
msgget:
    ret

global msgsnd
msgsnd:
    ret

global msgrcv
msgrcv:
    ret

global msgctl
msgctl:
    ret

global sysinfo
sysinfo:
    ret

global uname
uname:
    ret

global sethostid
sethostid:
    ret

global gethostid
gethostid:
    ret

global setdomainname
setdomainname:
    ret

global getdomainname
getdomainname:
    ret

global reboot_system
reboot_system:
    ret

global poweroff
poweroff:
    ret

global halt
halt:
    ret

global kbd_init
kbd_init:
    ret

global mouse_init
mouse_init:
    ret

global rtc_init
rtc_init:
    ret

global dma_init
dma_init:
    ret

global floppy_init
floppy_init:
    ret

global hdd_init
hdd_init:
    ret

global cdrom_init
cdrom_init:
    ret

global usb_init
usb_init:
    ret

global pci_scan
pci_scan:
    ret

global ps2_init
ps2_init:
    ret

global com_init
com_init:
    ret

global lpt_init
lpt_init:
    ret

global vbe_init
vbe_init:
    ret

global vesa_init
vesa_init:
    ret

global gfx_init
gfx_init:
    ret

global sound_init
sound_init:
    ret

global net_init
net_init:
    ret

global ne2000_init
ne2000_init:
    ret

global rtl8139_init
rtl8139_init:
    ret

global e1000_init
e1000_init:
    ret

global virtio_init
virtio_init:
    ret

global ahci_init
ahci_init:
    ret

global nvme_init
nvme_init:
    ret

global ext2_init
ext2_init:
    ret

global fat12_init
fat12_init:
    ret

global fat16_init
fat16_init:
    ret

global fat32_init
fat32_init:
    ret

global ntfs_init
ntfs_init:
    ret

global iso9660_init
iso9660_init:
    ret

global tmpfs_init
tmpfs_init:
    ret

global procfs_init
procfs_init:
    ret

global sysfs_init
sysfs_init:
    ret

global devfs_init
devfs_init:
    ret

global ramfs_init
ramfs_init:
    ret

global initrd_init
initrd_init:
    ret

global cpio_init
cpio_init:
    ret

global tarfs_init
tarfs_init:
    ret

global tty_init
tty_init:
    ret

global console_init
console_init:
    ret

global fbcon_init
fbcon_init:
    ret

global serial_console_init
serial_console_init:
    ret

global netconsole_init
netconsole_init:
    ret

global log_init
log_init:
    ret

global klog_init
klog_init:
    ret

global dmesg
dmesg:
    ret

global panic
panic:
    cli
    hlt
    jmp panic

global assert_failed
assert_failed:
    cli
    hlt
    jmp assert_failed

global stack_trace
stack_trace:
    ret

global backtrace
backtrace:
    ret

global dump_registers
dump_registers:
    ret

global dump_memory
dump_memory:
    ret

global hexdump
hexdump:
    ret

global debug_print
debug_print:
    ret

global kprintf
kprintf:
    ret

global sprintf
sprintf:
    ret

global snprintf
snprintf:
    ret

global vsprintf
vsprintf:
    ret

global vsnprintf
vsnprintf:
    ret

global vsscanf
vsscanf:
    ret

global sscanf
sscanf:
    ret

global qsort
qsort:
    ret

global bsearch
bsearch:
    ret

global lsearch
lsearch:
    ret

global hsearch
hsearch:
    ret

global tsearch
tsearch:
    ret

global crypt
crypt:
    ret

global encrypt
encrypt:
    ret

global decrypt
decrypt:
    ret

global md5
md5:
    ret

global sha1
sha1:
    ret

global sha256
sha256:
    ret

global sha512
sha512:
    ret

global crc32
crc32:
    ret

global adler32
adler32:
    ret

global base64_encode
base64_encode:
    ret

global base64_decode
base64_decode:
    ret

global url_encode
url_encode:
    ret

global url_decode
url_decode:
    ret

global html_encode
html_encode:
    ret

global html_decode
html_decode:
    ret

global json_parse
json_parse:
    ret

global json_stringify
json_stringify:
    ret

global xml_parse
xml_parse:
    ret

global lua_init
lua_init:
    ret

global lua_dostring
lua_dostring:
    ret

global python_init
python_init:
    ret

global python_dostring
python_dostring:
    ret

global js_init
js_init:
    ret

global js_dostring
js_dostring:
    ret

global shell_init
shell_init:
    ret

global shell_run
shell_run:
    ret

global cmd_parse
cmd_parse:
    ret

global cmd_execute
cmd_execute:
    ret

global builtin_cd
builtin_cd:
    ret

global builtin_pwd
builtin_pwd:
    ret

global builtin_ls
builtin_ls:
    ret

global builtin_cat
builtin_cat:
    ret

global builtin_echo
builtin_echo:
    ret

global builtin_cp
builtin_cp:
    ret

global builtin_mv
builtin_mv:
    ret

global builtin_rm
builtin_rm:
    ret

global builtin_mkdir_shell
builtin_mkdir_shell:
    ret

global builtin_rmdir_shell
builtin_rmdir_shell:
    ret

global builtin_ps
builtin_ps:
    ret

global builtin_kill_shell
builtin_kill_shell:
    ret

global builtin_mount_shell
builtin_mount_shell:
    ret

global builtin_umount_shell
builtin_umount_shell:
    ret

global builtin_clear
builtin_clear:
    ret

global builtin_date
builtin_date:
    ret

global builtin_uptime
builtin_uptime:
    ret

global builtin_uname_shell
builtin_uname_shell:
    ret

global builtin_whoami
builtin_whoami:
    ret

global builtin_env
builtin_env:
    ret

global builtin_export
builtin_export:
    ret

global builtin_alias
builtin_alias:
    ret

global builtin_unalias
builtin_unalias:
    ret

global builtin_history
builtin_history:
    ret

global builtin_source
builtin_source:
    ret

global builtin_exit
builtin_exit:
    ret

global builtin_reboot
builtin_reboot:
    ret

global builtin_poweroff
builtin_poweroff:
    ret

global builtin_halt_shell
builtin_halt_shell:
    ret

global builtin_klog
builtin_klog:
    ret

global builtin_dmesg_shell
builtin_dmesg_shell:
    ret

global builtin_hexdump_shell
builtin_hexdump_shell:
    ret

global builtin_panic_shell
builtin_panic_shell:
    ret

global builtin_help
builtin_help:
    ret

global user_init
user_init:
    ret

global user_login
user_login:
    ret

global user_add
user_add:
    ret

global user_del
user_del:
    ret

global user_passwd
user_passwd:
    ret

global group_add
group_add:
    ret

global group_del
group_del:
    ret

global group_mod
group_mod:
    ret

global perm_check
perm_check:
    ret

global acl_check
acl_check:
    ret

global cap_check
cap_check:
    ret

global audit_log
audit_log:
    ret

global quota_check
quota_check:
    ret

global quota_set
quota_set:
    ret

global resource_limit
resource_limit:
    ret

global setrlimit
setrlimit:
    ret

global getrlimit
getrlimit:
    ret

global setpriority
setpriority:
    ret

global getpriority
getpriority:
    ret

global sched_yield
sched_yield:
    ret

global sched_setscheduler
sched_setscheduler:
    ret

global sched_getscheduler
sched_getscheduler:
    ret

global sched_setparam
sched_setparam:
    ret

global sched_getparam
sched_getparam:
    ret

global sched_setaffinity
sched_setaffinity:
    ret

global sched_getaffinity
sched_getaffinity:
    ret

global sched_rr_get_interval
sched_rr_get_interval:
    ret

global pthread_create
pthread_create:
    ret

global pthread_join
pthread_join:
    ret

global pthread_exit
pthread_exit:
    ret

global pthread_self
pthread_self:
    ret

global pthread_mutex_init
pthread_mutex_init:
    ret

global pthread_mutex_lock
pthread_mutex_lock:
    ret

global pthread_mutex_unlock
pthread_mutex_unlock:
    ret

global pthread_cond_init
pthread_cond_init:
    ret

global pthread_cond_wait
pthread_cond_wait:
    ret

global pthread_cond_signal
pthread_cond_signal:
    ret

global pthread_key_create
pthread_key_create:
    ret

global pthread_key_delete
pthread_key_delete:
    ret

global pthread_setspecific
pthread_setspecific:
    ret

global pthread_getspecific
pthread_getspecific:
    ret

global dlopen
dlopen:
    ret

global dlclose
dlclose:
    ret

global dlsym
dlsym:
    ret

global dlerror
dlerror:
    ret

global modprobe
modprobe:
    ret

global insmod
insmod:
    ret

global rmmod
rmmod:
    ret

global lsmod
lsmod:
    ret

global kallsyms
kallsyms:
    ret

global kprobe_add
kprobe_add:
    ret

global kprobe_del
kprobe_del:
    ret

global uprobe_add
uprobe_add:
    ret

global uprobe_del
uprobe_del:
    ret

global tracepoint_add
tracepoint_add:
    ret

global tracepoint_del
tracepoint_del:
    ret

global ftrace_start
ftrace_start:
    ret

global ftrace_stop
ftrace_stop:
    ret

global perf_event_open
perf_event_open:
    ret

global perf_event_close
perf_event_close:
    ret

global perf_event_read
perf_event_read:
    ret

global bpf_load
bpf_load:
    ret

global seccomp
seccomp:
    ret

global prctl
prctl:
    ret

global arch_prctl
arch_prctl:
    ret

global ioperm
ioperm:
    ret

global iopl
iopl:
    ret

global pciconfig_read
pciconfig_read:
    ret

global pciconfig_write
pciconfig_write:
    ret

global syslog
syslog:
    ret

global klogctl
klogctl:
    ret

global sysfs_mount
sysfs_mount:
    ret

global proc_mount
proc_mount:
    ret

global dev_mount
dev_mount:
    ret

global tmpfs_mount
tmpfs_mount:
    ret

global ramfs_mount
ramfs_mount:
    ret

global rootfs_mount
rootfs_mount:
    ret

global pivot_root
pivot_root:
    ret

global chroot_sys
chroot_sys:
    ret

global switch_root
switch_root:
    ret

global init_module
init_module:
    ret

global finit_module
finit_module:
    ret

global delete_module
delete_module:
    ret

global get_kernel_syms
get_kernel_syms:
    ret

global query_module
query_module:
    ret

global create_module
create_module:
    ret

global kexec_load
kexec_load:
    ret

global kexec_file_load
kexec_file_load:
    ret

global kexec_reboot
kexec_reboot:
    ret

global watchdog_init
watchdog_init:
    ret

global watchdog_ping
watchdog_ping:
    ret

global watchdog_stop
watchdog_stop:
    ret

global hwmon_init
hwmon_init:
    ret

global thermal_init
thermal_init:
    ret

global cpufreq_init
cpufreq_init:
    ret

global cpuidle_init
cpuidle_init:
    ret

global suspend
suspend:
    ret

global resume
resume:
    ret

global hibernate
hibernate:
    ret

global thaw
thaw:
    ret

global pm_init
pm_init:
    ret

global acpi_poweroff
acpi_poweroff:
    ret

global acpi_reboot
acpi_reboot:
    ret

global efi_init
efi_init:
    ret

global efi_get_variable
efi_get_variable:
    ret

global efi_set_variable
efi_set_variable:
    ret

global efi_reset
efi_reset:
    ret

global uefi_exit_boot_services
uefi_exit_boot_services:
    ret

global bios32_init
bios32_init:
    ret

global bios32_call
bios32_call:
    ret

global v86_init
v86_init:
    ret

global v86_call
v86_call:
    ret

global long_mode_init
long_mode_init:
    ret

global enter_long_mode
enter_long_mode:
    ret

global compat_mode_init
compat_mode_init:
    ret

global syscall64_entry
syscall64_entry:
    ret

global sysenter64_entry
sysenter64_entry:
    ret

global int80_handler
int80_handler:
    ret

global debug_exception
debug_exception:
    ret

global nmi_handler
nmi_handler:
    ret

global breakpoint_handler
breakpoint_handler:
    ret

global overflow_handler
overflow_handler:
    ret

global bound_handler
bound_handler:
    ret

global invalid_opcode_handler
invalid_opcode_handler:
    ret

global device_not_available
device_not_available:
    ret

global coprocessor_segment_overrun
coprocessor_segment_overrun:
    ret

global invalid_tss
invalid_tss:
    ret

global segment_not_present
segment_not_present:
    ret

global stack_segment_fault
stack_segment_fault:
    ret

global alignment_check
alignment_check:
    ret

global machine_check
machine_check:
    ret

global simd_exception
simd_exception:
    ret

global virtualization_exception
virtualization_exception:
    ret

global control_protection_exception
control_protection_exception:
    ret

global x87_fpu_error
x87_fpu_error:
    ret

global x87_fpu_pending
x87_fpu_pending:
    ret

global math_fault
math_fault:
    ret

global spurious_interrupt
spurious_interrupt:
    ret

global error_interrupt
error_interrupt:
    ret

global init_vectors
init_vectors:
    ret

global install_isr
install_isr:
    ret

global install_irq
install_irq:
    ret

global uninstall_isr
uninstall_isr:
    ret

global uninstall_irq
uninstall_irq:
    ret

global enable_irq
enable_irq:
    ret

global disable_irq
disable_irq:
    ret

global irq_ack
irq_ack:
    ret

global softirq_init
softirq_init:
    ret

global raise_softirq
raise_softirq:
    ret

global do_softirq
do_softirq:
    ret

global tasklet_init
tasklet_init:
    ret

global tasklet_schedule
tasklet_schedule:
    ret

global tasklet_kill
tasklet_kill:
    ret

global workqueue_init
workqueue_init:
    ret

global queue_work
queue_work:
    ret

global flush_work
flush_work:
    ret

global cancel_work
cancel_work:
    ret

global kthread_create
kthread_create:
    ret

global kthread_run
kthread_run:
    ret

global kthread_stop
kthread_stop:
    ret

global kthread_should_stop
kthread_should_stop:
    ret

global idle_thread
idle_thread:
    ret

global init_thread
init_thread:
    ret

global main_thread
main_thread:
    ret

global kmain
kmain:
    ret

section .data
align 4
rand_seed dd 0x12345678
timer_ticks dd 0
cursor_pos dd 0
key_buffer db 0
current_task dd 0
task_list dd 0
heap_start dd 0

section .bss
align 16
stack_bottom:
    resb 16384
stack_top:

align 4096
page_directory:
    resb 4096
page_table_0:
    resb 4096
page_table_1:
    resb 4096

align 8
gdt_entries:
    resb 56
gdt_ptr:
    resw 1
    resd 1

align 8
idt_entries:
    resb 2048
idt_ptr:
    resw 1
    resd 1

align 16
tss_entry:
    resb 104

align 16
fpu_state:
    resb 512

align 16
sse_state:
    resb 512

align 16
xsave_state:
    resb 4096

align 4096
kernel_heap:
    resb 1048576

align 4096
user_stack:
    resb 4096

align 4096
kernel_stack:
    resb 4096

align 4096
interrupt_stack:
    resb 4096

align 4096
page_alloc_bitmap:
    resb 131072

align 4096
vmm_structures:
    resb 65536

align 4096
task_structs:
    resb 262144

align 4096
file_table:
    resb 65536

align 4096
inode_cache:
    resb 131072

align 4096
dentry_cache:
    resb 262144

align 4096
buffer_cache:
    resb 524288

align 4096
socket_buffers:
    resb 131072

align 4096
net_devices:
    resb 65536

align 4096
arp_table:
    resb 4096

align 4096
routing_table:
    resb 16384

align 4096
dns_cache:
    resb 4096

align 4096
process_list:
    resb 65536

align 4096
syscall_table:
    resb 2048

align 4096
exception_handlers:
    resb 128

align 4096
irq_handlers:
    resb 256

align 4096
softirq_vec:
    resb 256

align 4096
timer_list:
    resb 4096

align 4096
wait_queues:
    resb 65536

align 4096
completion_vars:
    resb 4096

align 4096
spinlocks:
    resb 4096

align 4096
mutexes:
    resb 4096

align 4096
semaphores:
    resb 4096

align 4096
rwlocks:
    resb 4096

align 4096
rcu_data:
    resb 65536

align 4096
percpu_data:
    resb 262144

align 4096
boot_params:
    resb 4096

align 4096
multiboot_info:
    resb 4096

align 4096
efi_system_table:
    resb 4096

align 4096
acpi_tables:
    resb 131072

align 4096
smp_cpu_data:
    resb 65536

align 4096
lapic_regs:
    resb 4096

align 4096
ioapic_regs:
    resb 4096

align 4096
hpet_regs:
    resb 4096

align 4096
pit_regs:
    resb 16

align 4096
rtc_regs:
    resb 16

align 4096
dma_regs:
    resb 64

align 4096
pic_regs:
    resb 16

align 4096
ps2_buffer:
    resb 256

align 4096
keyboard_buffer:
    resb 256

align 4096
mouse_buffer:
    resb 256

align 4096
serial_buffers:
    resb 4096

align 4096
vga_buffer:
    resb 4000

align 4096
framebuffer:
    resb 8388608

align 4096
vesa_info:
    resb 512

align 4096
vbe_mode_info:
    resb 256

align 4096
disk_buffer:
    resb 4096

align 4096
ide_channels:
    resb 256

align 4096
ahci_ports:
    resb 4096

align 4096
nvme_queues:
    resb 16384

align 4096
pci_devices:
    resb 65536

align 4096
usb_devices:
    resb 131072

align 4096
virtio_devices:
    resb 65536

align 4096
input_devices:
    resb 4096

align 4096
sound_devices:
    resb 4096

align 4096
net_devices_list:
    resb 8192

align 4096
fs_types:
    resb 2048

align 4096
mounted_fs:
    resb 4096

align 4096
super_blocks:
    resb 65536

align 4096
vfs_inodes:
    resb 131072

align 4096
vfs_dentries:
    resb 262144

align 4096
vfs_files:
    resb 131072

align 4096
page_cache:
    resb 1048576

align 4096
swap_cache:
    resb 524288

align 4096
ipc_ids:
    resb 16384

align 4096
msg_queues:
    resb 65536

align 4096
sem_arrays:
    resb 32768

align 4096
shm_segments:
    resb 65536

align 4096
pty_masters:
    resb 4096

align 4096
pty_slaves:
    resb 4096

align 4096
tty_drivers:
    resb 8192

align 4096
console_drivers:
    resb 4096

align 4096
klog_buffer:
    resb 131072

align 4096
printk_buffer:
    resb 8192

align 4096
debug_symbols:
    resb 1048576

align 4096
kallsyms_data:
    resb 524288

align 4096
module_list:
    resb 131072

align 4096
export_symbols:
    resb 262144

align 4096
kprobe_table:
    resb 65536

align 4096
trace_buffer:
    resb 1048576

align 4096
perf_events:
    resb 262144

align 4096
bpf_progs:
    resb 131072

align 4096
seccomp_filters:
    resb 65536

align 4096
cgroups:
    resb 262144

align 4096
namespaces:
    resb 65536

align 4096
capabilities:
    resb 4096

align 4096
credentials:
    resb 65536

align 4096
audit_buffer:
    resb 131072

align 4096
selinux_data:
    resb 524288

align 4096
apparmor_data:
    resb 262144

align 4096
tomoyo_data:
    resb 131072

align 4096
smack_data:
    resb 65536

align 4096
yama_data:
    resb 4096

align 4096
keys_data:
    resb 131072

align 4096
crypto_algs:
    resb 65536

align 4096
crypto_tfms:
    resb 131072

align 4096
random_pool:
    resb 4096

align 4096
entropy_count:
    resb 4

align 4096
urandom_buffer:
    resb 4096

align 4096
zlib_workspace:
    resb 262144

align 4096
lz4_workspace:
    resb 131072

align 4096
lzo_workspace:
    resb 131072

align 4096
xz_workspace:
    resb 524288

align 4096
json_parser_buf:
    resb 131072

align 4096
xml_parser_buf:
    resb 131072

align 4096
lua_state:
    resb 1048576

align 4096
python_state:
    resb 2097152

align 4096
js_state:
    resb 524288

align 4096
shell_history:
    resb 8192

align 4096
shell_aliases:
    resb 4096

align 4096
env_vars:
    resb 16384

align 4096
user_database:
    resb 65536

align 4096
group_database:
    resb 32768

align 4096
shadow_database:
    resb 65536

align 4096
quota_database:
    resb 131072

align 4096
acl_database:
    resb 131072

align 4096
resource_limits:
    resb 262144

align 4096
scheduler_queues:
    resb 262144

align 4096
affinity_masks:
    resb 65536

align 4096
thread_structs:
    resb 524288

align 4096
futex_queues:
    resb 131072

align 4096
robust_lists:
    resb 65536

align 4096
dl_modules:
    resb 262144

align 4096
hwmon_sensors:
    resb 65536

align 4096
thermal_zones:
    resb 16384

align 4096
cpufreq_policies:
    resb 16384

align 4096
cpuidle_drivers:
    resb 4096

align 4096
pm_qos_data:
    resb 4096

align 4096
wakeup_sources:
    resb 4096

align 4096
watchdog_devices:
    resb 4096

align 4096
edac_mc_data:
    resb 65536

align 4096
ras_data:
    resb 131072

align 4096
mce_log:
    resb 65536

align 4096
numa_nodes:
    resb 262144

align 4096
memory_zones:
    resb 524288

align 4096
buddy_allocator:
    resb 1048576

align 4096
slab_caches:
    resb 524288

align 4096
slub_data:
    resb 262144

align 4096
slob_data:
    resb 65536

align 4096
vm_areas:
    resb 524288

align 4096
mm_structs:
    resb 1048576

align 4096
vma_structs:
    resb 2097152

align 4096
page_tables:
    resb 4194304

align 4096
ksm_data:
    resb 262144

align 4096
hugepages:
    resb 1048576

align 4096
transparent_hugepages:
    resb 524288

align 4096
mempolicy_data:
    resb 131072

align 4096
migrate_data:
    resb 262144

align 4096
compaction_data:
    resb 131072

align 4096
reclaim_data:
    resb 65536

align 4096
writeback_data:
    resb 131072

align 4096
bio_structs:
    resb 262144

align 4096
request_queues:
    resb 524288

align 4096
gendisk_structs:
    resb 131072

align 4096
hd_structs:
    resb 262144

align 4096
partition_tables:
    resb 65536

align 4096
mbr_buffers:
    resb 4096

align 4096
gpt_buffers:
    resb 131072

align 4096
device_mapper:
    resb 262144

align 4096
md_devices:
    resb 131072

align 4096
raid_structs:
    resb 524288

align 4096
lvm_data:
    resb 262144

align 4096
crypt_data:
    resb 65536

align 4096
loop_devices:
    resb 65536

align 4096
nbd_devices:
    resb 32768

align 4096
iscsi_data:
    resb 262144

align 4096
fc_data:
    resb 131072

align 4096
srp_data:
    resb 65536

align 4096
nvmet_data:
    resb 131072

align 4096
target_data:
    resb 262144

align 4096
eth_devices:
    resb 65536

align 4096
wifi_devices:
    resb 65536

align 4096
bridge_ports:
    resb 4096

align 4096
vlan_devices:
    resb 4096

align 4096
bond_devices:
    resb 4096

align 4096
team_devices:
    resb 4096

align 4096
tun_tap_devices:
    resb 4096

align 4096
veth_pairs:
    resb 4096

align 4096
macvlan_devices:
    resb 4096

align 4096
ipvlan_devices:
    resb 4096

align 4096
vxlan_devices:
    resb 4096

align 4096
geneve_devices:
    resb 4096

align 4096
gre_tunnels:
    resb 4096

align 4096
ipip_tunnels:
    resb 4096

align 4096
sit_tunnels:
    resb 4096

align 4096
ip6_tunnels:
    resb 4096

align 4096
xfrm_policies:
    resb 131072

align 4096
xfrm_states:
    resb 262144

align 4096
ipsec_data:
    resb 131072

align 4096
wireguard_peers:
    resb 65536

align 4096
openvpn_data:
    resb 65536

align 4096
ppp_data:
    resb 4096

align 4096
slip_data:
    resb 4096

align 4096
hdlc_data:
    resb 4096

align 4096
frame_relay:
    resb 4096

align 4096
atm_devices:
    resb 4096

align 4096
x25_data:
    resb 4096

align 4096
lapb_data:
    resb 4096

align 4096
can_devices:
    resb 4096

align 4096
bluetooth_devices:
    resb 16384

align 4096
rfcomm_data:
    resb 4096

align 4096
hidp_data:
    resb 4096

align 4096
bnep_data:
    resb 4096

align 4096
cmtp_data:
    resb 4096

align 4096
l2cap_data:
    resb 16384

align 4096
sco_data:
    resb 4096

align 4096
hci_devices:
    resb 16384

align 4096
nfc_devices:
    resb 4096

align 4096
ieee802154_devices:
    resb 4096

align 4096
lowpan_data:
    resb 4096

align 4096
rpl_data:
    resb 4096

align 4096
mpls_data:
    resb 4096

align 4096
netfilter_tables:
    resb 524288

align 4096
iptables_data:
    resb 131072

align 4096
ip6tables_data:
    resb 131072

align 4096
arptables_data:
    resb 16384

align 4096
ebtables_data:
    resb 16384

align 4096
conntrack_table:
    resb 1048576

align 4096
nat_table:
    resb 524288

align 4096
tc_qdiscs:
    resb 131072

align 4096
tc_filters:
    resb 65536

align 4096
tc_actions:
    resb 32768

align 4096
socket_data:
    resb 524288

align 4096
unix_sockets:
    resb 65536

align 4096
inet_sockets:
    resb 262144

align 4096
inet6_sockets:
    resb 262144

align 4096
netlink_sockets:
    resb 65536

align 4096
packet_sockets:
    resb 16384

align 4096
raw_sockets:
    resb 16384

align 4096
sctp_data:
    resb 65536

align 4096
dccp_data:
    resb 65536

align 4096
rds_data:
    resb 65536

align 4096
tipc_data:
    resb 65536

align 4096
vsock_data:
    resb 16384

align 4096
kcm_data:
    resb 4096

align 4096
tls_data:
    resb 65536

align 4096
smc_data:
    resb 65536

align 4096
phonet_data:
    resb 4096

align 4096
caif_data:
    resb 4096

align 4096
nfc_sockets:
    resb 4096

align 4096
ieee802154_sockets:
    resb 4096

align 4096
alg_sockets:
    resb 4096

align 4096
kcm_sockets:
    resb 4096

align 4096
qrtr_data:
    resb 4096

align 4096
sysv_ipc_data:
    resb 65536

align 4096
posix_ipc_data:
    resb 65536

align 4096
mq_data:
    resb 65536

align 4096
eventfd_data:
    resb 4096

align 4096
eventpoll_data:
    resb 65536

align 4096
timerfd_data:
    resb 4096

align 4096
signalfd_data:
    resb 4096

align 4096
memfd_data:
    resb 4096

align 4096
userfaultfd_data:
    resb 4096

align 4096
aio_data:
    resb 131072

align 4096
io_uring_data:
    resb 262144

align 4096
fanotify_data:
    resb 16384

align 4096
inotify_data:
    resb 16384

align 4096
dnotify_data:
    resb 4096

align 4096
quota_data:
    resb 65536

align 4096
xfs_quota_data:
    resb 65536

align 4096
ext4_quota_data:
    resb 65536

align 4096
btrfs_quota_data:
    resb 65536

align 4096
f2fs_quota_data:
    resb 65536

align 4096
ocfs2_quota_data:
    resb 65536

align 4096
gfs2_quota_data:
    resb 65536

align 4096
jfs_quota_data:
    resb 65536

align 4096
reiserfs_quota_data:
    resb 65536

align 4096
nilfs2_quota_data:
    resb 65536

align 4096
udf_quota_data:
    resb 65536

align 4096
hfs_quota_data:
    resb 65536

align 4096
hfsplus_quota_data:
    resb 65536

align 4096
befs_quota_data:
    resb 65536

align 4096
qnx4_quota_data:
    resb 65536

align 4096
qnx6_quota_data:
    resb 65536

align 4096
minix_quota_data:
    resb 65536

align 4096
omfs_quota_data:
    resb 65536

align 4096
romfs_quota_data:
    resb 65536

align 4096
cramfs_quota_data:
    resb 65536

align 4096
squashfs_quota_data:
    resb 65536

align 4096
vxfs_quota_data:
    resb 65536

align 4096
sysv_quota_data:
    resb 65536

align 4096
ufs_quota_data:
    resb 65536

align 4096
efs_quota_data:
    resb 65536

align 4096
affs_quota_data:
    resb 65536

align 4096
ecryptfs_data:
    resb 131072

align 4096
encfs_data:
    resb 131072

align 4096
fuse_data:
    resb 262144

align 4096
overlayfs_data:
    resb 131072

align 4096
unionfs_data:
    resb 131072

align 4096
aufs_data:
    resb 131072

align 4096
nfs_data:
    resb 262144

align 4096
cifs_data:
    resb 262144

align 4096
smb_data:
    resb 262144

align 4096
coda_data:
    resb 65536

align 4096
afs_data:
    resb 131072

align 4096
p9_data:
    resb 65536

align 4096
ceph_data:
    resb 262144

align 4096
glusterfs_data:
    resb 262144

align 4096
lustre_data:
    resb 524288

align 4096
orangefs_data:
    resb 131072

align 4096
configfs_data:
    resb 65536

align 4096
debugfs_data:
    resb 65536

align 4096
tracefs_data:
    resb 65536

align 4096
pstore_data:
    resb 131072

align 4096
efivarfs_data:
    resb 65536

align 4096
bpf_fs_data:
    resb 65536

align 4096
binfmt_misc_data:
    resb 4096

align 4096
binfmt_elf_data:
    resb 4096

align 4096
binfmt_script_data:
    resb 4096

align 4096
binfmt_aout_data:
    resb 4096

align 4096
binfmt_flat_data:
    resb 4096

align 4096
binfmt_em86_data:
    resb 4096

align 4096
core_pattern:
    resb 4096

align 4096
coredump_data:
    resb 1048576

align 4096
crashkernel_data:
    resb 268435456