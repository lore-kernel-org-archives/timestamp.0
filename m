Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252C1136B
	for <timestamp@lists.linux.dev>; Thu,  7 Sep 2023 07:57:15 +0000 (UTC)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-490e78ae83bso256665e0c.0
        for <timestamp@lists.linux.dev>; Thu, 07 Sep 2023 00:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1694073435; x=1694678235; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BYCw6MjcMH0VBXX64k2n7JI1Ap28j06fLMRRfYT33EM=;
        b=vscA9pueNV7GH/6qa/oG7WZog97EAh5BjThmw9MpvZz421XXSExx5jcZMrVv1ftQcB
         QCSJRSE8fHqfHp8dNmESrXImJ1WsZh7agio4rCPXNxatLsRI+2fLeiIetf0dAT5fWn3N
         Ic9qhWWHuvAhPWTPBP5yv/oq+qMAxpea0uS1lKDILK6s7pwVNegVb3KTRA2la62x4eOx
         NQGY1TP36yeMiWmGVfTjaJrBE3+egkQs5PviBpeY9mHqH3Uo9XVuotqunCgA8+TPh5Cs
         2MT2KwUkSFZjkBk1D7gjoSgUYtGj92O6cDVx8N8viLkYnXgE2RmdFMNHT/7YU9p9QkdE
         Wm8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694073435; x=1694678235;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BYCw6MjcMH0VBXX64k2n7JI1Ap28j06fLMRRfYT33EM=;
        b=BCVuNllTiWx4v2lpKUL6/RKVvVED9yT7kGHbl6fT9V0aoWnOlwkqAcqxURbznj5fAD
         BMZeIFHaI2VuiQmHG1RwuraOuclmesfPmgZpkZ+JmTCGw7STtoPkgFu5yg4PS9Yc2sK1
         6Hy3PmCZ3r3Yq/VT6Vyj8vRnUSv108pVy4wnWF8esnbjGgOLysuiayCzhWNAvGNOnk9f
         C6VOo3SGzXlujBrQ6jLHB6Ugulh3yX21yPNG/Gzmz4CkjYAHHS7jSh8uyZjT4qDFKyuK
         JHtmPHbmEE/tNKnQ+e14QX7ed7Y7INx36JfB8swVpoLA5yAyp70QbvT0bc/uC4t4wzEt
         vFxg==
X-Gm-Message-State: AOJu0YypBvK5s7u2pu7ltuL9yLeYIRfmSo19HRpYsFUU7g3W7tGSkJna
	URYNBGFDZRv8oCiJj7eikJt5dRlM2h+iUKt220Wm+g==
X-Google-Smtp-Source: AGHT+IEKK3pIZHt2QRqcId7nWRc2DLGZhZ7BIVl+nPAXJnwX2Sf45+9R0pQFVmMx9pkduIAsjCSxAhDM52WNmcfhZPQ=
X-Received: by 2002:a67:fa11:0:b0:44d:6290:e422 with SMTP id
 i17-20020a67fa11000000b0044d6290e422mr4850316vsq.35.1694073434785; Thu, 07
 Sep 2023 00:57:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-8-brgl@bgdev.pl>
 <CACRpkdbdcPv1LHL2W-enKBJ2OARpduoOJkQ64oL6GSOfmmD3qQ@mail.gmail.com>
In-Reply-To: <CACRpkdbdcPv1LHL2W-enKBJ2OARpduoOJkQ64oL6GSOfmmD3qQ@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 7 Sep 2023 09:57:03 +0200
Message-ID: <CAMRc=McSBBeHi5jDVYOF6s1etfQzYRNLo25LeY+DWG_2tEf7=w@mail.gmail.com>
Subject: Re: [PATCH 07/21] gpiolib: provide gpio_device_get_base()
To: Linus Walleij <linus.walleij@linaro.org>, Dipen Patel <dipenp@nvidia.com>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-acpi@vger.kernel.org, timestamp@lists.linux.dev, 
	linux-tegra@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 7, 2023 at 9:17=E2=80=AFAM Linus Walleij <linus.walleij@linaro.=
org> wrote:
>
> On Tue, Sep 5, 2023 at 8:53=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Let's start adding getters for the opaque struct gpio_device. Start wit=
h
> > a function allowing to retrieve the base GPIO number.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> I guess you have a solid usecase for drivers needing to do this
> crazy thing, because I suppose you feel as much as me that
> this should rather be gpiolib-internal and confined to
> drivers/gpio/gpiolib.h?
>
> If you add a valid reason for making this globally visible outside
> of drivers/[gpio|pinctrl] to the commit message I guess I can live
> with it because we need to think of the bigger picture:
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
>
> It brings to mind the now confusing "base" inside of
> struct gpio_chip. We all know it should go away, but since it
> is never used during the lifetime of the gpio_chip - or SHOULD
> never be used - it should rather be an argument to
> [devm_]gpiochip_add_data( .... int base);...
>
> Maybe something we should add to our TODO file.
>
> Yours,
> Linus Walleij

For this series it's the HTE driver that uses it and I don't have a
good idea about how to change it. Dipen?

I would also love to make pinctrl not use the internal GPIOLIB header
so it'll be another user, unless you can figure out a way to not use
gc->base? :)

I think we're stuck with it for now.

Bart
