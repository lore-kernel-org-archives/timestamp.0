Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB703136B
	for <timestamp@lists.linux.dev>; Thu,  7 Sep 2023 07:20:52 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-d77a4e30e97so580901276.2
        for <timestamp@lists.linux.dev>; Thu, 07 Sep 2023 00:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694071252; x=1694676052; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pwy6uKOVyjPH/vJMAsaPCoM0fNwaGdU7NPhSy+lwVBs=;
        b=EAWhEiXP6cMMbtaVzh/IiHuWGvfFD9/tQr+cvBim6qOk1J5pS6BXQGqf5hFcgjxigZ
         cqDMTEPT2W65DvP2FNDxaom+IXtwofB9/aPtxGVbtYKn/PV8G90vSLLz5co2gcAWvWJ0
         4lOnPAGfTwnEEcEV5q3erA7XS7sAGPzEP63UVOlSN3c9V3W8opdL8WBXC1EUDquyNvEF
         yC+Ow9Jm33lGg2WAHHTphTFdiPljNXkoxtueYD98yH6Gqvm2L8QRxKWIYALdlZEDvNZr
         D8uNBqGv4t5R380RUuH05pvXfAiQTOCPdiQahmoIuhfJGO+DWIK15nhwm/tA38tdjQUY
         PtNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694071252; x=1694676052;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pwy6uKOVyjPH/vJMAsaPCoM0fNwaGdU7NPhSy+lwVBs=;
        b=dEq40H2ZzykOOW+zNog5s8V4xuHMsvFSB5XHSoyS1gPmzQBPHN8hFaD9/zBahJKQW5
         JwCxlhW10w0dP62krdCFcvhh78SbGsAIMOnE0B6Qp6Sb8UwcvLeBpwU2O+8wP3eDqEvz
         Oio0AAvpqhjHo11s10BGom2w6juAmE6K6HxKnug8+axHWA0RcFjAWvC+4tSlxWkpHPPQ
         WdD5zgVRndlJt0EdhP579AS7WQxzIH4AxMhxaWS3fiuV4QLIqnSDSvR+Z/dpI1MqBQa0
         NP3PE8tUTabIjBoOFh7/2GKyhgtLGJjwBrL7Gw19EPe3tP7tcGNtZ/BUugetfbBlgOj/
         yvbA==
X-Gm-Message-State: AOJu0YyRi2mG8S0GSwzygxpM8nZaeAAAfkPvVqVmgl+szjiLwxso5H3Y
	Ij/2tElhRFcRCx9ByKXWWZDQlDLtfMAfAyzfu9ZCcw==
X-Google-Smtp-Source: AGHT+IFDrgWVURx3JNju7kZZF1wu9Y/TadMJ5yuRpzoXN8X2bh2xdWz8hzInBvmi+tzixNC0aGXs9GN4uotRGCxcdwY=
X-Received: by 2002:a25:dc54:0:b0:d44:a90b:ba50 with SMTP id
 y81-20020a25dc54000000b00d44a90bba50mr19457872ybe.5.1694071251891; Thu, 07
 Sep 2023 00:20:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-11-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-11-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 7 Sep 2023 09:20:40 +0200
Message-ID: <CACRpkdZdaBELiyR8da2GHxj+=FFzsvL+5POX5139+OTA8rKUeg@mail.gmail.com>
Subject: Re: [PATCH 10/21] gpiolib: replace find_chip_by_name() with gpio_device_find_by_label()
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Dipen Patel <dipenp@nvidia.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-acpi@vger.kernel.org, timestamp@lists.linux.dev, 
	linux-tegra@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 5, 2023 at 8:53=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Remove all remaining uses of find_chip_by_name() (and subsequently:
> gpiochip_find()) from gpiolib.c and use the new
> gpio_device_find_by_label() instead.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

With Andy's comment addressed:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
