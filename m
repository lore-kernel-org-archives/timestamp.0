Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847251B278
	for <timestamp@lists.linux.dev>; Mon, 23 Oct 2023 18:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="qRKwXoWb"
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-7b5fe8ab5f9so1369064241.3
        for <timestamp@lists.linux.dev>; Mon, 23 Oct 2023 11:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1698085257; x=1698690057; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2lA7u/KwHbZjDwkrCQtE/aGz8soCrQO6TnRku5ElS1M=;
        b=qRKwXoWbHo8V5ZzxtFUGGa9vdhNsOve78vkuYXHrUp8kHy25wM/vr+f0fr6zS2ay21
         2WQwDmIoOlY7aAuBgBj48dA+b2qjd0b3ljC28m4/qDsOqSbzttRPRxEd6ONPDDqpWGf8
         7JIWqUI8AgHq8CdQvVETcJ/92Yw8EqSS3vxo3re2wrGIwHecxqHN6peUrdf+WN6Gizzv
         UAs7PIg/1b8CV9PXIDl1C2paXBywsc2ni+HO/tqG2Nv0J6kc/KQGxqsSXLajEJExevlg
         kq4EkOhNZ4w39T8pf1zsog+xZAnyYyib3RgtYBgiW4xt6y+aY0wdMng21wFDBq2/9+e0
         1AMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698085257; x=1698690057;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2lA7u/KwHbZjDwkrCQtE/aGz8soCrQO6TnRku5ElS1M=;
        b=RZbprucCdPXc/CcS1rDjcCBrm6AYR7GpxzfHeKXN+0vnLfDeJfxBZwQYDjs2xoP4e1
         v76Q3iMgcPC4E0UJ6d17k7aiQqcVVB4SJra9CNUCH3zH66tTlZjGOenNTnfxKWbmDshr
         lYOuiG9ijweRChOl3gEYmFAXxOHEfFpRayWGc4Tzae1I5bYOpFY84nsb2gKgpVHzFAyv
         WiMCWTEHXaPt8f8o+uUtDIYuc6+jsH1mmQakrxdehQOc7JNgtWUa2JBdPr6tPFnTnJ20
         pIOlS1IpRhb8dIw2FAOAgFEYoBd4yq9j4y5mKVCUeOvr0cO0SBtsmwqs458zp62aU10/
         bLhA==
X-Gm-Message-State: AOJu0YycnhdcqWQvNERz1cgxEHciGSin0UwWlWoqwg9W+89eX9mk4ktf
	t2UIGRt3ViwTrB+IQVlTasayGAZIwTvaMkzy4MdRCQ==
X-Google-Smtp-Source: AGHT+IEss1D7rJx7U841FkofMmztsAi5XD53agAT3T0X85OAQ68mbw9ZhE5Uif3hbK4ONSG5WfHdXGuanHDmltk1Rjk=
X-Received: by 2002:a67:cb9d:0:b0:458:3bc1:9777 with SMTP id
 h29-20020a67cb9d000000b004583bc19777mr8102288vsl.15.1698085257266; Mon, 23
 Oct 2023 11:20:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231023115646.3573494-1-arnd@kernel.org> <CAMRc=MdoRWn_grWoKWagAi11S=mZ9RbP673L77a+qfN_8oTBcg@mail.gmail.com>
 <CAMRc=Mc7PCEimVEJ_JYg=4+X5PAJ1Lh2SxXsNEFpuKctbEPiYg@mail.gmail.com> <1e603c14-54aa-1ea8-cac7-99b29af92b4b@nvidia.com>
In-Reply-To: <1e603c14-54aa-1ea8-cac7-99b29af92b4b@nvidia.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 23 Oct 2023 20:20:46 +0200
Message-ID: <CAMRc=Mc-G2DMcvBGpxZbEjgX9GZDTNLmpMJix+-AC23nKqPCpQ@mail.gmail.com>
Subject: Re: [PATCH] hte: tegra194: add GPIOLIB dependency
To: Dipen Patel <dipenp@nvidia.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, timestamp@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 23, 2023 at 7:26=E2=80=AFPM Dipen Patel <dipenp@nvidia.com> wro=
te:
>
> On 10/23/23 5:02 AM, Bartosz Golaszewski wrote:
> > On Mon, Oct 23, 2023 at 2:00=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev=
.pl> wrote:
> >>
> >> On Mon, Oct 23, 2023 at 1:57=E2=80=AFPM Arnd Bergmann <arnd@kernel.org=
> wrote:
> >>>
> >>> From: Arnd Bergmann <arnd@arndb.de>
> >>>
> >>> The driver started calling into a few interfaces that are part of GPI=
OLIB and
> >>> don't have stub implementations otherwise:
> >>>
> >>> drivers/hte/hte-tegra194.c: In function 'tegra_hte_line_xlate':
> >>> drivers/hte/hte-tegra194.c:424:48: error: implicit declaration of fun=
ction 'gpio_device_get_base'; did you mean 'gpio_device_get_desc'? [-Werror=
=3Dimplicit-function-declaration]
> >>>   424 |                 line_id =3D desc->attr.line_id - gpio_device_=
get_base(gs->gdev);
> >>>       |                                                ^~~~~~~~~~~~~~=
~~~~~~
> >>>       |                                                gpio_device_ge=
t_desc
> >>>
> >>> Add a Kconfig dependency to only allow building when this is defined.
> >>>
> >>> Fixes: dc850faa28ee0 ("hte: tegra194: don't access struct gpio_chip")
> >>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> >>> ---
> >>>  drivers/hte/Kconfig | 1 +
> >>>  1 file changed, 1 insertion(+)
> >>>
> >>> diff --git a/drivers/hte/Kconfig b/drivers/hte/Kconfig
> >>> index 083e67492bf2e..641af722b555d 100644
> >>> --- a/drivers/hte/Kconfig
> >>> +++ b/drivers/hte/Kconfig
> >>> @@ -17,6 +17,7 @@ if HTE
> >>>  config HTE_TEGRA194
> >>>         tristate "NVIDIA Tegra194 HTE Support"
> >>>         depends on (ARCH_TEGRA_194_SOC || COMPILE_TEST)
> >>> +       depends on GPIOLIB
> >>>         help
> >>>           Enable this option for integrated hardware timestamping eng=
ine also
> >>>           known as generic timestamping engine (GTE) support on NVIDI=
A Tegra194
> >>> --
> >>> 2.39.2
> >>>
> >>
> >> Thanks. None of the new interfaces are "consumer" APIs and are not
> >> meant to have stubs so depending on GPIOLIB is correct here.
> >>
> >> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Ah, this goes on top of the patch that is in my tree so I'll wait for
> > Dipen's Ack and apply it.
>
> Acked-by: Dipen Patel <dipenp@nvidia.com>
> >
> > Bart
>

I queued it. There's a trivial conflict with your HTE branch, Stephen
should be able to resolve it.

Bart
