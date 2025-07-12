#set page(
  width:5cm,
  height:5cm,
  margin:10pt,
)
// #set text(10pt)
#let tracking=0.2em
#let fli=1em
#let leading=1.1em
#let spacing=1.65em
#set place(right+top)
#state("pos").update((x:0pt,y:0pt))
#show regex("[\w]"):it=>context{
  let temp=measure(it)
  let pos=state("pos").get()
  place(it,dx:pos.x,dy:pos.y)
  state("pos").update(dic=>{(x:dic.x,y:dic.y+temp.height+tracking)})
}

#show heading:it=>{
  it.body
  parbreak() 
}

#show linebreak:it=>context {
  state("pos").update(dic=>(
    x:dic.x - leading,
    y:0pt)
  )
}

#show parbreak:it=>context{
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
あいうえおかきくけこ\
たちつてと

なにぬねの
#pagebreak()
さしすせそ