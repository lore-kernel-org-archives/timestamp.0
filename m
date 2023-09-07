Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649831116
	for <timestamp@lists.linux.dev>; Thu,  7 Sep 2023 07:35:31 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-d7b79a4899bso555960276.2
        for <timestamp@lists.linux.dev>; Thu, 07 Sep 2023 00:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694072130; x=1694676930; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RoLVfI/Qa17hM0LLGxXlqleEL6Bcc6ph7u/GtpOctOM=;
        b=DajOqDmIC2wbRQlocxgKS6NZjpg22DZRLTEUaTxROjnWr9F6N+ugLLndAbY3b2rw06
         o/OgGg/VkPI9nRxa4K6QfBGmfW8YUARqgIAcX6J5CO/xTJq/jhU6faOocZt823f0qQCk
         tto0c/chwXX+9/bi673DaCYk+OMMS0pmKcWae7apJH0y7YXeZZhSkCUn31KlCfkJzL6v
         WXp4l5c14QrrPH/yTXzvO057YsVT3klam76c+Kny+G0ZI1Usa3FCyuzSO6AoRsPtOxv9
         UvlG4IGonyz7RWJQEcU015p5ADcEmW3JvfcWqzwTctId9MSmvXwODxoHHUOOKfb/P0S7
         Y94g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694072130; x=1694676930;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RoLVfI/Qa17hM0LLGxXlqleEL6Bcc6ph7u/GtpOctOM=;
        b=AEIA2DkIEUFYGU/YRvHuPxic2pEXXpmyNDM57VWE9Octoa4qA7ydNrMZqooMGa7cu+
         5ro8QTa2EoKPZRYarFEg2IPefOv3Zf9/gq16ktFHBFcW1Q9YEo3LW+BQhqciJWERg55i
         INITqC+Yj63+zNVhI6NJn86Z2yU+g3zX5HS5ZWXsqPSvOx2icOP/T6e7ngyWnAV3CPtj
         vu+tzMzvQPd1d6P+rpPDJCSS3IbTowKQwxIEd2PweGBDPoaPidpeUR5ShuH0M3L6ey77
         nQ8HG8t/Y5qsGBmDOvCnuRHURXMR9GmQIy90d51y8kOhvQPQRku8YDOH1i+RdKq9KxHv
         mHmg==
X-Gm-Message-State: AOJu0Yyrs9+NKXfFgPu7qAFVUAqm0CDeIYNTmCWhmnhCyYIiywtyHs42
	z1EnyQb8E5RNxEC/BjzfXHGyrtsa+NGCZJFUVVvqyw==
X-Google-Smtp-Source: AGHT+IHG0TBlmxyoTQFIa7FFpqQqYMcVr4pyVQslrpSztqetV//HxeApegU4hZ/YXLQ350AtIlPtITxSVFId9gOqRWY=
X-Received: by 2002:a25:40a:0:b0:d7f:7690:d865 with SMTP id
 10-20020a25040a000000b00d7f7690d865mr6786114ybe.6.1694072130152; Thu, 07 Sep
 2023 00:35:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-16-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-16-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 7 Sep 2023 09:35:18 +0200
Message-ID: <CACRpkdaLKqNM1xMCo9jz1Pe_18A=GJodbaTHL+VmoRZa5jJbjQ@mail.gmail.com>
Subject: Re: [RFT PATCH 15/21] arm: omap1: ams-delta: stop using gpiochip_find()
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

Oops one more note:

On Tue, Sep 5, 2023 at 8:53=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> gpiochip_find() is going away as it's not hot-unplug safe. This platform
> is not affected by any of the related problems as this GPIO controller
> cannot really go away but in order to finally remove this function, we
> need to convert it to using gpio_device_find() as well.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
(...)
> +       struct gpio_device *gdev;
(...)
> +       gdev =3D gpio_device_find_by_label(OMAP_GPIO_LABEL);

This leaves a reference to the gdev right? No scoped guard?

If you leave a dangling reference intentionally I think it warrants
a comment ("leaving a ref here so the device will never be
free:ed").

Yours,
Linus Walleij
