##
## EPITECH PROJECT, 2017
## deBruijn
## File description:
## Makefile
##

NAME	=	deBrujin

SRC	=	app/Main.hs		\

all:	$(NAME)

$(NAME): $(SRC)
	stack build --copy-bins --local-bin-path .
	mv deBrujin-exe deBrujin

clean:
	stack clean
	rm .stack-work deBruijn.cabal -rf

fclean:	clean
	$(RM) $(NAME)

re:	fclean all

.PHONY: all clean fclean re
