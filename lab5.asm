TITLE ЛР_5 
;------------------------------------------------------------------------------
;ЛР  №5
;------------------------------------------------------------------------------
; Архітектура комп'ютера 1.
; Завдання:              Основи розробки і налагодження
; ВУЗ:                  НТУУ "КПІ"
; Факультет:    ФІОТ
; Курс:                1
; Група:       ІТ-03
;------------------------------------------------------------------------------
; Автор:        Бойко Карванський Карпов
; Дата:         14/04/21
;---------------------------------
IDEAL			; Директива - тип Асемблера tasm 
MODEL small		; Директива - тип моделі пам’яті 
STACK 2048		; Директива - розмір стеку 

DATASEG
array2Db db "7358118726277179" ; створення масиву
         db "4627022455147997"
         db "6691608838469303"
         db "1112568451217491"
         db "7514502072003748"
         db "6815604102002567"
         db "6018409102002858"
         db "7615687458914059"
         db "6659458123511791"
         db "6318954842615888"
         db "8715698421419564"
         db "1325082956458837"
         db "2080054842790953"
         db "6299944599303642"
         db "6176396115203803"
         db "2374689571001449"

CODESEG

Sort: ; сортування
    mov cx, 255 ; кількість повторів
    mov si, 0

    l1:
    push cx ;занесення значення cx до стеку

        l2:
        mov ah, [ds:si]  ;занесення значення для порівняння до ah
        mov al, [ds:si+1];занесення значення для порівняння до al

        cmp ah, al ;порівняння ah та al
        jg greater ; якщо al < ah, то перейти
        less:
            mov [ds:si], al   ;заміна значень
            mov [ds:si+1], ah ;заміна значень

        greater:
        inc si;збільшення значення si
        loop l2;перевірка cx

    mov si, 0
    pop cx ;діставання значення cx зі стеку
    loop l1;перевірка cx 
    jmp AfterSort;повертаємося з Sort 

Start:
    mov ax, @data ;занесення початку датасегменту до ax
    mov ds, ax ;ініціалізація датасегменту
    mov es, ax ;ініціалізація додаткового сегменту

    jmp Sort ; переходимо до Sort
    AfterSort: ;мітка для повернення


    mov ah,4ch
    int 21h ; виклик переривання DOS

end Start