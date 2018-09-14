if exists("current_compiler")
  finish
  endif
  let current_compiler = "pychris"

  let s:cpo_save = &cpo
  set cpo&vim

  CompilerSet errorformat=\ \ \ \ %f\ line\ %l\ in\ %m%r
  CompilerSet makeprg=python2\ %
let &cpo = s:cpo_save
  unlet s:cpo_save
