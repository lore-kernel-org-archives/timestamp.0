Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A14A20
	for <timestamp@lists.linux.dev>; Mon,  2 Oct 2023 08:33:14 +0000 (UTC)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-49966c6fafbso6293353e0c.0
        for <timestamp@lists.linux.dev>; Mon, 02 Oct 2023 01:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696235593; x=1696840393; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VWuACrVMiSb7UXfUbQbyMPZK0CXvOIuNQRYAat1PZ5c=;
        b=jEwYcDLTz+rzzOAeHsrV5LCK2/X6stNsomp375OiU5USS5V5Rb/E8Jp4Rx/gJKVAvV
         6WsSpDRO5Ya2UnkukzLF9CriY+zrNWCDKYSqdVX637wIVLQLv/U6HQINn8dxdlyZT1bX
         b5woN86+qAVkVm0ZfZz+bQfz4PgShdYAZCfu/EG+NjuyiQDJZ8g+jveelMmZIS8ToI0c
         HyNFnpv967/B03Sy0V+Pnix7LX85kGLoeHkasEfJ5mLvCLb2CTgt0MWS2Bz9rtmOx2EP
         LisCxtStj0z0H7xA8nNZ4sZqmRT19H4pEZLPyvXim2H1LCYqTInk7Op1fQzur6V9ygOy
         ENpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696235593; x=1696840393;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VWuACrVMiSb7UXfUbQbyMPZK0CXvOIuNQRYAat1PZ5c=;
        b=S8YjTGBf/IEChpDaI7cAyYk7oPf3jGA8viO5g+EN8B7ssaAQTFb2OFmtZoZlDAaprg
         5z2fCG+0QHsNf9AaXTJkG0q0X/nEwmNI8TnmxgKm1x1YcEHKA6OunjJm8e8yZiwO7Nns
         +bdp+hM4M+3RuRZrVba3IsN/cb8cEFGiC70Vo5R2AU58gG6dW8fNIhecToivLk52mINB
         MF5QcQ8RivhcfYY6SmZzun6Ergboj0yJTve5PGZhbyhyJborTvMSM9qH5JrU3KZprjsK
         g2pegFu32UFXQMwRY9HWvBNyO8+44RKn/DJMZqmR4E3rJRGsbsSTTDv8VQubapYYR6wV
         CMdg==
X-Gm-Message-State: AOJu0YydwsaD8gIYtRHlhZGkELJv6NlGcTYaVWk3OX2otCfzSp1Za6T5
	bt2i39QeU9lDQ/rveQbdwfW7sMQ8MDMgozW3lOHDbQ==
X-Google-Smtp-Source: AGHT+IFfKpIXAiatz/Qemg0XDFz87eh8j3hgBkyqc/WD9Z2//Ssp0YA84oFp4tG14Pz/tbr/mMsJDoMhwpf1CGKdmto=
X-Received: by 2002:a1f:4c05:0:b0:49a:b9d3:692a with SMTP id
 z5-20020a1f4c05000000b0049ab9d3692amr8265541vka.5.1696235593620; Mon, 02 Oct
 2023 01:33:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230911094443.14040-1-brgl@bgdev.pl> <cd4df23c-cc02-6723-e36d-34ca03409e6e@nvidia.com>
In-Reply-To: <cd4df23c-cc02-6723-e36d-34ca03409e6e@nvidia.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 2 Oct 2023 10:33:02 +0200
Message-ID: <CAMRc=MeWXapho1bsX9Si5uSx7MWVhpT2cqrv5S+qPo51Ko=Vtg@mail.gmail.com>
Subject: Re: [PATCH] hte: tegra194: improve the GPIO-related comment
To: Dipen Patel <dipenp@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	timestamp@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 29, 2023 at 11:38=E2=80=AFPM Dipen Patel <dipenp@nvidia.com> wr=
ote:
>
> On 9/11/23 2:44 AM, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Using any of the GPIO interfaces using the global numberspace is
> > deprecated. Make it clear in the comment.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > Acked-by: Linus Walleij <linus.walleij@linaro.org>
> > ---
> > This was part of a wider series but since this is independent, I'm send=
ing
> > it separately.
> >
> >  drivers/hte/hte-tegra194.c | 13 ++++++++-----
> >  1 file changed, 8 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/hte/hte-tegra194.c b/drivers/hte/hte-tegra194.c
> > index 6fe6897047ac..9fd3c00ff695 100644
> > --- a/drivers/hte/hte-tegra194.c
> > +++ b/drivers/hte/hte-tegra194.c
> > @@ -407,12 +407,15 @@ static int tegra_hte_line_xlate(struct hte_chip *=
gc,
> >               return -EINVAL;
> >
> >       /*
> > +      * GPIO consumers can access GPIOs in two ways:
> >        *
> > -      * There are two paths GPIO consumers can take as follows:
> > -      * 1) The consumer (gpiolib-cdev for example) which uses GPIO glo=
bal
> > -      * number which gets assigned run time.
> > -      * 2) The consumer passing GPIO from the DT which is assigned
> > -      * statically for example by using TEGRA194_AON_GPIO gpio DT bind=
ing.
> > +      * 1) Using the global GPIO numberspace.
> > +      *
> > +      * This is the old, now DEPRECATED method and should not be used =
in
> > +      * new code. TODO: Check if tegra is even concerned by this.
> This use case is to do namespace mapping from gpio subsystem to hte. Few =
doubts:
> 1. What does deprecate mean here? Does gpio subsys not use global space a=
nymore?

It does but we don't want to expose this to external users in any way
anymore (and haven't to for years). This is what deprecated means.
Users should deal with opaque GPIO descriptors not global GPIO
numberspace.

> 2. If yes, what GPIO number is set when it comes from gpiolib-cdev, as ba=
sed on that I may have to
> reflect in the mapping, tegra194_aon_gpio_map for example.

Why DO you have to use a GPIO number though? If HTE needs just a
number from some HTE numberspace (which in itself may be unnecessary)
then why not just keep a local IDA for it? Do you have to know the
GPIOs internal numbering scheme to make it work?

Bart

> > +      *
> > +      * 2) Using GPIO descriptors that can be assigned to consumer dev=
ices
> > +      * using device-tree, ACPI or lookup tables.
> >        *
> >        * The code below addresses both the consumer use cases and maps =
into
> >        * HTE/GTE namespace.
>
