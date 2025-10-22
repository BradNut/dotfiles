skip_global_compinit=1
autoload -Uz +X compinit
functions[compinit]=$'print -u2 \'compinit being called at \'${funcfiletrace[1]}
'${functions[compinit]}
