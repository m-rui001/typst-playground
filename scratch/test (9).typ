#show math.equation.where(block: false): it => context {
  let Ps = query(selector(<Pend>).before(here()))
  if Ps == () or Ps.last().location().position() != here().position() {
    h(0.25em, weak: true)
  } else { h(-0.25em, weak: true) }
  it + h(0.25em, weak: true) + [#h(0pt)<Mend>]
}
#show regex("[，。：；？！…,.():;?!]"): it => context {
  show regex("[，。、：；？！…)]"): it => it + [#h(0pt)<Pend>]
  let Ms = query(selector(<Mend>).before(here()))
  if Ms != () and Ms.last().location().position() == here().position() {
      h(-0.25em, weak: true)
  }
  it
}