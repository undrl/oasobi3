#set page(
  width:5cm,
  height:5cm,
  margin:10pt,
)
#set place(right+top)
#state("pos").update((x:0pt,y:0pt))
#show regex("[\w]"):it=>context{
  let temp=measure(it)
  let pos=state("pos").get()
  place(it,dy:pos.y)
  state("pos").update(dic=>{(x:dic.x,y:dic.y+temp.height)})
}

あいうえおかきくけこたちつてと