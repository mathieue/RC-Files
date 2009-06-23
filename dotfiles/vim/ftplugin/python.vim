" activer le filetype plugin avec la commande suivante dans le vimrc :
" if has("autocmd")
"   filetype plugin on
" endif

 " Active l'auto-complètement pour python
 set omnifunc=pythoncomplete#Complete

 " Quelques recommandations PEP8
 "
 " nombre d'espace par tab
 setlocal tabstop=4

 " nombre de caractère utilisé pour l'indentation:
 setlocal shiftwidth=4

 " pour convertir les tab en espaces
 setlocal expandtab

 " pour que backspace supprime 4 espaces:
 setlocal softtabstop=4

 " sur pression de la touche F3 highlight les caractères qui dépassent la
 " 80ème colonne
 map <silent> <F3> "<Esc>:match ErrorMsg '\%>80v.\+'<CR>"

 " met en sur brillance les espaces et les tabs en trop
 " pas réellement pour le python mais j'aime bien
 highlight RedundantSpaces ctermbg=red guibg=red
 match RedundantSpaces /\s\+$\| \+\ze\t\|\t/

