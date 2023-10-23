Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC92918032
	for <timestamp@lists.linux.dev>; Mon, 23 Oct 2023 12:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="RAp3HYaw"
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-4a4021adbc7so1171855e0c.2
        for <timestamp@lists.linux.dev>; Mon, 23 Oct 2023 05:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1698062538; x=1698667338; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YV9S8Dl1QFTNoTqt6zU/0XcXKKZm0RVI8YwTgV3zwuI=;
        b=RAp3HYawAc7T2cfs0EoAWZP+cZNL+DSZNFpaWY2/d9VTT4dyfoglK4+BnljoeP+k/F
         KmNmfaglLbMcsUnVsC3adrDhkdNXAr87uykHxBELLT+AQ7RfH2yoCzbFD30GG9wx3MHF
         PgV0YzDO2v3qI5IGThjXN0Syf45gvnM6Dv9Dr/OoeFOXUSga+bXzLcwbHCf9hXASG4GY
         JJSoMzHrTQtf9jgXn7WUkI+0D0coySaMraj5E65J89RGgozSYI6B/f68J03/gU9lXJD1
         d4do+Lqmlyuy0Ogs66iKLjrtzGJ7b2bhqO3gqWF3r0xeuYTvUF/sEF0ZyAFA9/dQxa02
         smMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698062538; x=1698667338;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YV9S8Dl1QFTNoTqt6zU/0XcXKKZm0RVI8YwTgV3zwuI=;
        b=WBOFDExB7sdT3Mc04P0/eIh0qtNbk8Orjzn9LHPrZXpRiituha9vBwF7ZlwJ4BoDu6
         Iw1zeiBDsivWa8fLP5OD8RuVbizFH2v41UXJcnfC7Pdx58NzVQmNIb0BKApRQIzUKahL
         6ZQWNPdxCRZ/tntuvZDhnREAQWlVl/iN1QbFR9H+KozFMxMfC61IIUkQRwxip4rycxVL
         j8m5zI7wFirMeJ9bUob53WQu3CZ5vdyZ8fpZ9IC6pzgpWGBWIVNEoOHGQyjuaPzsyaYZ
         9kNH9LMYqQuvUEOdpW9+s+gRYfg+gXEawQl79xh5lOTEwJxx5x1vbl6k5XLN4J0bsbUs
         xNug==
X-Gm-Message-State: AOJu0Yz3KUpjZFUGjUTkanuMfm3f5WjS9rDfyEYCc4wbj8R6R6f6aAY3
	Xj6O2iTKlqKWYxP6W3NM6uRL6FMsdyLxiA0IDDx0eg==
X-Google-Smtp-Source: AGHT+IH6TOp8anEI3dc3+ZGWts26YrV2cbzK9P5VunniwZKaSBSFLIWnU9EDk0SITpYbVx8W2UYUyUZnG5nwjipSgOY=
X-Received: by 2002:a05:6122:1d42:b0:490:c49e:3fe0 with SMTP id
 gd2-20020a0561221d4200b00490c49e3fe0mr8110182vkb.11.1698062537379; Mon, 23
 Oct 2023 05:02:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231023115646.3573494-1-arnd@kernel.org> <CAMRc=MdoRWn_grWoKWagAi11S=mZ9RbP673L77a+qfN_8oTBcg@mail.gmail.com>
In-Reply-To: <CAMRc=MdoRWn_grWoKWagAi11S=mZ9RbP673L77a+qfN_8oTBcg@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 23 Oct 2023 14:02:06 +0200
Message-ID: <CAMRc=Mc7PCEimVEJ_JYg=4+X5PAJ1Lh2SxXsNEFpuKctbEPiYg@mail.gmail.com>
Subject: Re: [PATCH] hte: tegra194: add GPIOLIB dependency
To: Arnd Bergmann <arnd@kernel.org>
Cc: Dipen Patel <dipenp@nvidia.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, timestamp@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 23, 2023 at 2:00=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> On Mon, Oct 23, 2023 at 1:57=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> w=
rote:
> >
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > The driver started calling into a few interfaces that are part of GPIOL=
IB and
> > don't have stub implementations otherwise:
> >
> > drivers/hte/hte-tegra194.c: In function 'tegra_hte_line_xlate':
> > drivers/hte/hte-tegra194.c:424:48: error: implicit declaration of funct=
ion 'gpio_device_get_base'; did you mean 'gpio_device_get_desc'? [-Werror=
=3Dimplicit-function-declaration]
> >   424 |                 line_id =3D desc->attr.line_id - gpio_device_ge=
t_base(gs->gdev);
> >       |                                                ^~~~~~~~~~~~~~~~=
~~~~
> >       |                                                gpio_device_get_=
desc
> >
> > Add a Kconfig dependency to only allow building when this is defined.
> >
> > Fixes: dc850faa28ee0 ("hte: tegra194: don't access struct gpio_chip")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > ---
> >  drivers/hte/Kconfig | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/hte/Kconfig b/drivers/hte/Kconfig
> > index 083e67492bf2e..641af722b555d 100644
> > --- a/drivers/hte/Kconfig
> > +++ b/drivers/hte/Kconfig
> > @@ -17,6 +17,7 @@ if HTE
> >  config HTE_TEGRA194
> >         tristate "NVIDIA Tegra194 HTE Support"
> >         depends on (ARCH_TEGRA_194_SOC || COMPILE_TEST)
> > +       depends on GPIOLIB
> >         help
> >           Enable this option for integrated hardware timestamping engin=
e also
> >           known as generic timestamping engine (GTE) support on NVIDIA =
Tegra194
> > --
> > 2.39.2
> >
>
> Thanks. None of the new interfaces are "consumer" APIs and are not
> meant to have stubs so depending on GPIOLIB is correct here.
>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Ah, this goes on top of the patch that is in my tree so I'll wait for
Dipen's Ack and apply it.

Bart
