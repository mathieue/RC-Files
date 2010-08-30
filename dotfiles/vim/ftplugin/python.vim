" activer le filetype plugin avec la commande suivante dans le vimrc :
" if has("autocmd")
"   filetype plugin on
" endif

 " Active l'auto-compl�tement pour python
 set omnifunc=pythoncomplete#Complete

 " Quelques recommandations PEP8
 "
 " nombre d'espace par tab
 setlocal tabstop=4

 " nombre de caract�re utilis� pour l'indentation:
 setlocal shiftwidth=4

 " pour convertir les tab en espaces
 setlocal expandtab

 " pour que backspace supprime 4 espaces:
 setlocal softtabstop=4

 " sur pression de la touche F3 highlight les caract�res qui d�passent la
 " 80�me colonne
 map <silent> <F3> "<Esc>:match ErrorMsg '\%>80v.\+'<CR>"

 " met en sur brillance les espaces et les tabs en trop
 " pas r�ellement pour le python mais j'aime bien
 highlight RedundantSpaces ctermbg=red guibg=red
 match RedundantSpaces /\s\+$\| \+\ze\t\|\t/

