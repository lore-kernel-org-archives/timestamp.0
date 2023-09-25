Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1DF11731
	for <timestamp@lists.linux.dev>; Mon, 25 Sep 2023 08:38:01 +0000 (UTC)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-7a7d7283fe5so1305685241.0
        for <timestamp@lists.linux.dev>; Mon, 25 Sep 2023 01:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1695631080; x=1696235880; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HFOxYCls0sYCllQ1mgWfAFcNmLca119HNJQDnS3pKX0=;
        b=DbB54rC2ewbILnbRLXB8P2a2tMC1EdInM3B+dn28ucEIkbJkRBHxVZbzPyj66Bwt+7
         j7vtEPKvJPipd+q1zRqc82fQVRCLvLAUrQMUocRhl+R5y98EoOFbpkgsH2kJ9oC5HYnM
         sSUKoaAKG1tlc1EsuQBg3QJCdTggAJFciiV/FATBHd0fb0StiCDVKiTzGqb4ndT6/LCo
         WZ6FryAzPuOZ/ZQaU4Bzi94IT7jDrH/PMIo/jv/gOxi9V8EK25sQCpfwlGlEm039a7rY
         uN1tIYDRHPngebKlX2yvyhLJuxDtIamUHTFSZRvNcizEBxrQlyNAgei7/GrxIS2Sw1qh
         xqQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695631080; x=1696235880;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HFOxYCls0sYCllQ1mgWfAFcNmLca119HNJQDnS3pKX0=;
        b=vv+KIoBumreH3URJR2V0QJt3kMouSV/AiAAv0b2Zn8l9EmVyZjo6ZwghdM54tJZ6Zi
         fZg/QBP80OqKSUKUo+UFLgtn+I2nizH1zAxnoa9j+hB1ZdPAFuSU0zyu2lzfNynrBoPJ
         XXbPMdA8zE+fM/xuwwXoVdi0VQc/5HPO72uxHAOX/kRVRk0P0s25JiR8u6xK+qPEshA0
         Zi9G7VOPkbywBQcffago5YMYH7i4aoGUNJBCQJ0xUjgPWJOEX9VmT4gcIP6mDUfDHKts
         RfVak+nWvN/W/nWkenAz73tCtJCrGPHll9dnIOAJS1n0hsTYFPw5T/lECAxfz7Q/dIEG
         4WFQ==
X-Gm-Message-State: AOJu0Yw3UBxr+qlhU2qoFqpr4D8Hw1cxoCckGc/Ybbns4BHfIQhNJBNo
	IYORQWCa6cBL5LOls/XIyjjn05+7eqSwLB/7tZxqmoNmkGycHht5
X-Google-Smtp-Source: AGHT+IHkGvxBZdjvWDB0bY3ahVJKD7QgsZAYcsxr6/DnPpYZSXZcLVj7/mrRGoGE8MLghxAusQ1uPxPjGj+qcralCps=
X-Received: by 2002:a67:eb16:0:b0:452:6ac7:cdf with SMTP id
 a22-20020a67eb16000000b004526ac70cdfmr2100526vso.24.1695631080119; Mon, 25
 Sep 2023 01:38:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230911094604.14179-1-brgl@bgdev.pl>
In-Reply-To: <20230911094604.14179-1-brgl@bgdev.pl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 25 Sep 2023 10:37:49 +0200
Message-ID: <CAMRc=Mc2Yo61uivOWHagR2Raxh11dBb=S6jtCDu8_-csX3ozvw@mail.gmail.com>
Subject: Re: [PATCH] hte: allow building modules with COMPILE_TEST enabled
To: Dipen Patel <dipenp@nvidia.com>
Cc: timestamp@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 11, 2023 at 11:46=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Allow building all HTE modules with COMPILE_TEST Kconfig option enabled.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> This was part of a wider series but since this is independent, I'm sendin=
g
> it separately.
>
>  drivers/hte/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/hte/Kconfig b/drivers/hte/Kconfig
> index cf29e0218bae..083e67492bf2 100644
> --- a/drivers/hte/Kconfig
> +++ b/drivers/hte/Kconfig
> @@ -16,7 +16,7 @@ if HTE
>
>  config HTE_TEGRA194
>         tristate "NVIDIA Tegra194 HTE Support"
> -       depends on ARCH_TEGRA_194_SOC
> +       depends on (ARCH_TEGRA_194_SOC || COMPILE_TEST)
>         help
>           Enable this option for integrated hardware timestamping engine =
also
>           known as generic timestamping engine (GTE) support on NVIDIA Te=
gra194
> @@ -25,7 +25,7 @@ config HTE_TEGRA194
>
>  config HTE_TEGRA194_TEST
>          tristate "NVIDIA Tegra194 HTE Test"
> -        depends on HTE_TEGRA194
> +        depends on (HTE_TEGRA194 || COMPILE_TEST)
>          help
>           The NVIDIA Tegra194 GTE test driver demonstrates how to use HTE
>           framework to timestamp GPIO and LIC IRQ lines.
> --
> 2.39.2
>

Hi Dipen!

Any comments on this, the other patch with a comment update as well as
the one addressing usage of gpiochip_find() in HTE drivers?

Bart
