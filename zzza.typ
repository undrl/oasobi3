#set page(
  width:5cm,
  height:10cm,
  margin:10pt,
)
// #set text(10pt)
#let tracking=0.2em
#let fli=1em
#let leading=1.1em
#let spacing=1.65em
#set place(right+top)

#show ",":"、"
#show ".":"。"
#show "、":box.with(inset:(top:-0.5em,bottom:0.5em))
#show "。":box.with(inset:(top:-0.5em,bottom:0.5em))
#show regex("[ぁぃぅぇぉゃゅょゎァィゥェォャュョヮヵヶ]"):box.with(inset:(right:-0.1em,top:-0.1em,bottom:0.1em))
#show "っ":box.with(inset:(right:-0.2em,top:-0.1em,bottom:0.1em))
#show "<":"＜"
#show ">":"＞"
#show regex("[＜＞]"):it=>box(inset:(right:0em,y:-0.1em),rotate(90deg,scale(x:60%,y:100%,it)))
#show "ー":it=>rotate(90deg,it)

#state("pos").update((x:0pt,y:0pt))
#show regex("[\w,.ー!?、。！？\p{Open_Punctuation}\p{Close_Punctuation}<>＜＞a-zA-Z]"):it=>context{
  let temp=measure(it)
  let pos=state("pos").get()
  place(it,dx:pos.x,dy:pos.y)
  state("pos").update(dic=>{(x:dic.x,y:dic.y+temp.height+tracking)})
}

#show heading:it=>{
  it.body
  parbreak() 
}

#show linebreak:it=>{
  state("pos").update(dic=>(
    x:dic.x - leading,
    y:0pt)
  )
}

#show parbreak:it=>{
  state("pos").update(dic=>(
    x:dic.x - spacing,
    y:0pt)
  )
}
#show pagebreak:it=>{
  it
  state("pos").update(dic=>(
    x:0pt,
    y:0pt)
  )
}
= 縦書き
かきくけこ

= 横書き

一ページ内で改行は想定外

なにぬねの
#pagebreak()
= たてたてがき
さしすせそ
\<無能\>
＜あああ＞