---
title: "{{ replace .Name "-" " " | title }}"
description: 
date: {{ .Date }}
slug: {{ substr (md5 (printf "%s%s" .Date (replace .TranslationBaseName "-" " " | title))) 4 8 }}
image: 
math: 
license: CC BY-NC 4.0
hidden: false
comments: true
categories:
tags:
draft: true
---
