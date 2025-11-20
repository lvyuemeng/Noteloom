#let join-comma(list) = {
  if list.len() == 2 {
    list.join(" and ")
  } else {
    list.join(", ")
  }
}