---
title: "{{ replace .Name "-" " " | title }}"
description: 
date: {{ .Date }}
slug: {{ substr (md5 (printf "%s%s" .Date (replace .TranslationBaseName "-" " " | title))) 4 8 }}
image: 
math: 
license: 
hidden: false
comments: true
categories:
tags:
draft: true
---
