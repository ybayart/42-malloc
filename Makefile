ifeq ($(HOSTTYPE),)
	HOSTTYPE := $(shell uname -m)_$(shell uname -s)
endif

CC			=	gcc
RM			=	rm -f
AR			=	ar rc
RN			=	ranlib

CFLAGS		=	-Wall -Wextra -Werror -lft
SAN_LEAK	=	-fsanitize=leak
SAN_ADDR	=	-fsanitize=address

SRCS_DIR	=	srcs/
INCS_DIR	=	includes/
LIBFT_DIR	=	libft/
TEST_DIR	=	test/

SRCS_LIST	=	malloc		\

INCS_LIST	=	malloc		\
				libinc		\
				proto		\

TEST_LIST	=	main		\

SRCS		=	$(addprefix $(SRCS_DIR), $(addsuffix .c, $(SRCS_LIST)))
INCS		=	$(addprefix $(INCS_DIR), $(addsuffix .h, $(INCS_LIST)))
TEST		=	$(addprefix $(TEST_DIR), $(addsuffix .c, $(TEST_LIST)))
OBJS		=	$(SRCS:.c=.o)

NAME_BASE	=	libft_malloc
NAME		=	$(NAME_BASE)_$(HOSTTYPE).so
NAME_GLOBAL	=	$(NAME_BASE).so
NAME_EXEC	=	malloc

.c.o:
			$(CC) $(CFLAGS) -c -I$(INCS_DIR) -I$(LIBFT_DIR) $< -o $(<:.c=.o)

all:		$(NAME)

$(NAME):	$(OBJS) libft $(INCS) Makefile
			make -C $(LIBFT_DIR)
			$(AR) $(NAME) $(OBJS)
			$(RN) $(NAME)
			ln -fs $(NAME) $(NAME_GLOBAL)

main:		$(NAME)
			$(CC) -o $(NAME_EXEC) $(TEST) -L $(LIBFT_DIR) $(CFLAGS)

clean:
			@rm -rf $(OBJS)

fclean:		clean
			@rm -rf $(NAME) $(NAME_GLOBAL)

ffclean:	fclean
			@make -C $(LIBFT_DIR) fclean
			@rm -rf *.so

re:			fclean all

rre:		ffclean all

.PHONY:		all clean fclean ffclean re rre
