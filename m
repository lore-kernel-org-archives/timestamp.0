Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757BD1C2B4
	for <timestamp@lists.linux.dev>; Thu, 12 Oct 2023 08:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="wDmkTe5O"
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-7b5f28da928so296723241.0
        for <timestamp@lists.linux.dev>; Thu, 12 Oct 2023 01:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697098839; x=1697703639; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LBSR0wcYspbRO3qzDDOttNnFk8Qm8m44q1aDPM4j6u0=;
        b=wDmkTe5OCm041r4W157nXtIZxsL+zBmfHIUIPHCe4LaOoHaz7+DuSIERxDCkrs9r2x
         W2tkyU3lsI+FecpMb1Wa18fJH8GYZClnHAzUf4g2LGIMgnRO9eqX6spQBGztRXmODMlj
         XKnNpJWPY21+qxPs3C/Ji1rLFxJun5LTDLWhwp9C4d79VWMExPN/8CSDcVTWPY24Q8os
         H+odMBa41N/WzOYCPPJZx6Ep9VLozG0RxLA2C4inbqBq045VO1SPjnpajOQfF+xnr3VK
         28xwoHi2yCBHJD+r+UdZPuy2Iyq0OM3CsC8X3yeHFzihuNBodjdYnOVenq/HiRo7QThU
         zEKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697098839; x=1697703639;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LBSR0wcYspbRO3qzDDOttNnFk8Qm8m44q1aDPM4j6u0=;
        b=l2Pn7R0ab7CeJU5ktIVbaa9DszgWgkD4kJZRoM8o56F4t7z5ZEfbV4ymdJ7cCNs8xG
         EqMu9H7I1XGP4Miu8HCE4EYaErr3iVqWDfjzM5tZBPMNjSClxAfLO9GHcnuEp/XokIY6
         SprNZFQM2faozvq8P+6vCzyYQzEM2P+zz9G8f6mrC1QnatB5dwwX2pz4GBViicE1PlSB
         SZ5AxGALAFVr1xpb+Xw5dZjmFgz4I1T1enO1gfJ17tDK+FklLxUCHr5u3ioYzO8lZ5QM
         tbPJWRCeywQKSaSkW8bvEshl87edMmL5H6uB62Bhc2IpLVSkCbrJ7w6Xm91Vtijx4pQw
         TBgw==
X-Gm-Message-State: AOJu0YzS3QfhLPxG6FVT8NJS7TienL1PVdGU/mt94elDx6fovVAkMvRI
	pPtFr0TZ88X7c5A945GolubDIaNTnZ9999GJvtJ4DA==
X-Google-Smtp-Source: AGHT+IFU2WYRRKW4Qp7Y1F9HNt5ENojY0muko4VO6nlQ050sR3rUD8QC3m4FSm2ajkrFxiVe+ICyPjzlUKQJfuBVBGM=
X-Received: by 2002:a05:6102:905:b0:457:a912:20c7 with SMTP id
 x5-20020a056102090500b00457a91220c7mr3053797vsh.5.1697098838451; Thu, 12 Oct
 2023 01:20:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231011202638.372382-1-andriy.shevchenko@linux.intel.com> <75fe5f3f-41d7-76f8-47f9-9178fa030804@nvidia.com>
In-Reply-To: <75fe5f3f-41d7-76f8-47f9-9178fa030804@nvidia.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 12 Oct 2023 10:20:27 +0200
Message-ID: <CAMRc=McMzH4Tsr3wASN+cTfr=W-K4OnD4gO4xOxRO=aVffbpKw@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] hte: Improve GPIO handling and other cleanups
To: Dipen Patel <dipenp@nvidia.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	timestamp@lists.linux.dev, linux-tegra@vger.kernel.org, 
	Andy Shevchenko <andy@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 12, 2023 at 12:59=E2=80=AFAM Dipen Patel <dipenp@nvidia.com> wr=
ote:
>
> On 10/11/23 1:26 PM, Andy Shevchenko wrote:
> > This is a series that provides a new API to GPIO library (so far only
> > available in the GPIO tree), and respective update to the Tegra
> > HTE driver. On top a couple of other cleaups (patches 3 & 4, they
> > can be applied separately).
> >
> > Patch 2 inherited tags from its respective discussion thread [1].
> >
> > Due to dependencies this either should be applied to the GPIO tree,
> > or to the HTE when GPIO updates land the upstream (optionally with
> > the first patch be applied even now to the GPIO tree independently).
> >
> > Another option is to have an immutable branch or tag, but I assume
> > that was discussed and rejected (?) in [1].
> >
> > In v2:
> > - collected tags (Linus, Dipen)
> > - fixed couple of typos (Dipen)
> >
> > Link: https://lore.kernel.org/linux-gpio/20230905185309.131295-15-brgl@=
bgdev.pl/ [1]
> > Cc: Dipen Patel <dipenp@nvidia.com>
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> >
> > Andy Shevchenko (3):
> >   gpiolib: provide gpio_device_find_by_fwnode()
> >   hte: tegra194: Remove redundant dev_err()
> >   hte: tegra194: Switch to LATE_SIMPLE_DEV_PM_OPS()
> >
> > Bartosz Golaszewski (1):
> >   hte: tegra194: don't access struct gpio_chip
> >
> >  drivers/gpio/gpiolib.c      | 20 ++++++++++++++++
> >  drivers/hte/hte-tegra194.c  | 46 +++++++++++++++++++------------------
> >  include/linux/gpio/driver.h |  1 +
> >  3 files changed, 45 insertions(+), 22 deletions(-)
> >
> Looks great...I am going to assume you are going to push patches 1 and 2 =
through
> gpio subsystem and rest through HTE, right?
>
> Reviewed-by: Dipen Patel <dipenp@nvidia.com>
> Tested-by: Dipen Patel <dipenp@nvidia.com>
>

Yes, let me queue them right away.

Bart
