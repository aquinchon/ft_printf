# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aquincho <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/05/13 09:46:38 by aquincho          #+#    #+#              #
#    Updated: 2022/05/13 09:46:41 by aquincho         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME			= libftprintf.a

INCLUDE			= includes/
CC				= gcc
CFLAGS			= -Wall -Werror -Wextra
RM				= rm -f
AR				= ar rcs

LIBFT_PATH = libft/
LIBFT_FUNCTIONS = ft_itoa ft_putchar_fd ft_strlen ft_atoi
LIBFT = $(addprefix $(LIBFT_PATH), $(addsuffix .c, $(LIBFT_FUNCTIONS)))

SRCS_PATH		= srcs/
SRCS_FUNCTIONS	= ft_printf ft_process_conv ft_printchar ft_printnbr \
ft_printunbr ft_printxnbr ft_printptr ft_utils
SRCS = $(addprefix $(SRCS_PATH), $(addsuffix .c, $(SRCS_FUNCTIONS)))
SRCS += $(LIBFT)

OBJS = $(SRCS:.c=.o)

%.o: %.c
	$(CC) $(CFLAGS) -I $(INCLUDE) -c $< -o $@

$(NAME): $(OBJS)
	ar cr $(NAME) $(OBJS)
	ranlib $(NAME)

all:	$(NAME)

bonus:	$(NAME)

clean:
	$(RM) $(OBJS)

fclean:	clean
	$(RM) $(NAME)

re: fclean all

.PHONY: clean fclean re all
