Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731A118032
	for <timestamp@lists.linux.dev>; Mon, 23 Oct 2023 12:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Jv9iQOXI"
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-49d14708479so1414897e0c.2
        for <timestamp@lists.linux.dev>; Mon, 23 Oct 2023 05:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1698062453; x=1698667253; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DXG6D39H/bG+JdWvKirNbcyn6AT+8IVB18CJ9gYiVCs=;
        b=Jv9iQOXIHF3RkCu8J2ZrwkCBZoZMFyoRKySzBU5Ymy9XrWs1+ywOnY2hhUJ4zxmnRk
         Pmyd25mGAOYUOKUDWCqGpeW0nxDAv7usjbDjst8Zf5RcJC+Y2M9EG6Px/lhoAIN4HxaA
         LBFoC2BLGs8E+cGxgfNHaVXG30Nf22ckWp4VQFK73yhct0bRdn8kKT2d/NC3BZnQJaLQ
         oh6w9pOpfnctrllnsysPChCMUnf+TqUdL/ngTT8EUA9tetzpDLyTCu/PjXYCT3Wldpf4
         c1BNJxUE4AdiX15Ny2reYq2Kn4Hh2XG+3ngG31SsjBlwEcsKdutq8gaWO+jbbZacT2yj
         AwEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698062453; x=1698667253;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DXG6D39H/bG+JdWvKirNbcyn6AT+8IVB18CJ9gYiVCs=;
        b=KvG8WXtVb/J0T/WqTZLc9SrsGcHv3xaV2iuiXyE0n2ufRx4NRdEpYD43kdAHg7cXI3
         MKMWHZVMUE/cbCHn+sQZFd3j5jqKF4bE6f7GNon+kwcf1Aa0+ZF6Gk1jhfz4PnYB+WEH
         NswMqIBckXEQs3UUaxnIuMzb1lpumVibXDmZ0cEsdFtSjhcg033zo1A0q8hb725cUQpn
         ghfBnazR1Mmt0Bel1JWUDRFXUe8d0nwoQWxVUhu65a90W5w0tUTv53eluwiy9aJRTc+m
         bbo2fwXsNKmQpJfkRXhhRuTSzwRZGJn5urLhUy/gfDEq91JVbsypSBSyfirt6V6aFzOE
         +ygA==
X-Gm-Message-State: AOJu0YxRqdBD33SclvS5EJ5PNeBKFOU+6B/PM+tR7nfhOGUrUWKOe76c
	dnl1owmAgmbZN9H1H1SZ1cKAM0NOQ/XAY7jOZmlPew==
X-Google-Smtp-Source: AGHT+IEGXz1mVss0Wa0MXPTI7LAnBw2Bts58E0ff225vnT/BeF9e4M6TFlY7QUUnrcU56mmYn06MkCpd1A56MG+2bAA=
X-Received: by 2002:a05:6122:12f4:b0:49d:10ce:9a8b with SMTP id
 k20-20020a05612212f400b0049d10ce9a8bmr7783435vkp.15.1698062453198; Mon, 23
 Oct 2023 05:00:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231023115646.3573494-1-arnd@kernel.org>
In-Reply-To: <20231023115646.3573494-1-arnd@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 23 Oct 2023 14:00:42 +0200
Message-ID: <CAMRc=MdoRWn_grWoKWagAi11S=mZ9RbP673L77a+qfN_8oTBcg@mail.gmail.com>
Subject: Re: [PATCH] hte: tegra194: add GPIOLIB dependency
To: Arnd Bergmann <arnd@kernel.org>
Cc: Dipen Patel <dipenp@nvidia.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, timestamp@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 23, 2023 at 1:57=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The driver started calling into a few interfaces that are part of GPIOLIB=
 and
> don't have stub implementations otherwise:
>
> drivers/hte/hte-tegra194.c: In function 'tegra_hte_line_xlate':
> drivers/hte/hte-tegra194.c:424:48: error: implicit declaration of functio=
n 'gpio_device_get_base'; did you mean 'gpio_device_get_desc'? [-Werror=3Di=
mplicit-function-declaration]
>   424 |                 line_id =3D desc->attr.line_id - gpio_device_get_=
base(gs->gdev);
>       |                                                ^~~~~~~~~~~~~~~~~~=
~~
>       |                                                gpio_device_get_de=
sc
>
> Add a Kconfig dependency to only allow building when this is defined.
>
> Fixes: dc850faa28ee0 ("hte: tegra194: don't access struct gpio_chip")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/hte/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/hte/Kconfig b/drivers/hte/Kconfig
> index 083e67492bf2e..641af722b555d 100644
> --- a/drivers/hte/Kconfig
> +++ b/drivers/hte/Kconfig
> @@ -17,6 +17,7 @@ if HTE
>  config HTE_TEGRA194
>         tristate "NVIDIA Tegra194 HTE Support"
>         depends on (ARCH_TEGRA_194_SOC || COMPILE_TEST)
> +       depends on GPIOLIB
>         help
>           Enable this option for integrated hardware timestamping engine =
also
>           known as generic timestamping engine (GTE) support on NVIDIA Te=
gra194
> --
> 2.39.2
>

Thanks. None of the new interfaces are "consumer" APIs and are not
meant to have stubs so depending on GPIOLIB is correct here.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
