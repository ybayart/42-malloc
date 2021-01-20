/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_rep_free.c                                      :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ybayart <marvin@42.fr>                     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/02/26 15:25:37 by ybayart           #+#    #+#             */
/*   Updated: 2020/02/26 15:25:38 by ybayart          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

char	ft_rep_free(char ***args, char *str, size_t i)
{
	free((*args)[i]);
	(*args)[i] = ft_strdup(str);
	return (1);
}
