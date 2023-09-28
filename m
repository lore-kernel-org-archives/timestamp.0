Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A585523F
	for <timestamp@lists.linux.dev>; Thu, 28 Sep 2023 18:34:45 +0000 (UTC)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-7ae12c28776so2152449241.0
        for <timestamp@lists.linux.dev>; Thu, 28 Sep 2023 11:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1695926085; x=1696530885; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eHIi3+QPsqXjSO/wlLFP4QrQOZ0gG9LZj95iau1h3Hk=;
        b=A00tklxSWh5rwxjG9gQvvhRrukdF9KRyOYAUdn/hPR442QaO5wct/qOJ/5PQUdQFLk
         aUoMvbVE4/AtJYd6PpwvSgkzr5YkOxPv/9171pv8pMWH9Ft0222iO0o5aXE1IfAc03Ot
         l//9p13JXesSdy4T3ycoDM9h2OGtsckibohhPGzG+/vCpsvTgrTQiTqJaRoQrJPAVO+I
         8NegtQiKHiPClcTevgVHolD6EzDLLHkbywZsaJKJ82ZOOi1kS3Xg/ZrlWnxaDNB5eQ53
         TXevD7g1Jt48QygKT+VXhJZuu9Kw83nRxzwFonJR+nwFPGoqBmGke98FrVmxzQNZ2s2+
         EbBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695926085; x=1696530885;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eHIi3+QPsqXjSO/wlLFP4QrQOZ0gG9LZj95iau1h3Hk=;
        b=YPCuTQoCe5fYzhe+td2qyczOJYAxkfy/OWDCIS8ahMKBm67dvUgsFMhNS+KBek5nL1
         7XRFWx4T4M6t4+kdvxjoUHuUWGnDCVdtNy5VFNwm6jz9IunqmPgfwV3x0ifpiJT1zfI9
         Vhjy4czQ3iPiUqAC0lukmCNMWzK74BZv4LQX4ZchTY/AZh3GfvIKEUj866ABtBye/1jN
         oZ+dRVEvWZt5aqpf26rM0zvrQDpH4dF/aMX+vumjzIjjySHqTIJd+TuMUISGmlikmcvN
         rg0lSfPGUoIkdGQPKI3Hpjvg9FNagnnnr/ykqMu551mIPt9khG7wNEf+zRubzBaNmNOB
         5EpA==
X-Gm-Message-State: AOJu0Yzzk9o4WjdPZ6dv+zXrvQK8LxwZqIEen/7iQ+U4U3bXt0QO4XeJ
	I1Yso7LA+Fv0PkgbYa326qNY1hX9Zhb7AYNLMi3Mmw==
X-Google-Smtp-Source: AGHT+IFfrPviHFnqrsRkwxjM9DAezDyiIX28xKmpqMoiafFuHKCE4W2aBDxuAO+GvkGaHwv1eHIWt8Ff6Dq8HvmxDMM=
X-Received: by 2002:a05:6102:212:b0:44e:9113:ac58 with SMTP id
 z18-20020a056102021200b0044e9113ac58mr1677855vsp.6.1695926084825; Thu, 28 Sep
 2023 11:34:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230911094604.14179-1-brgl@bgdev.pl> <CAMRc=Mc2Yo61uivOWHagR2Raxh11dBb=S6jtCDu8_-csX3ozvw@mail.gmail.com>
 <04e28f8a-1393-d991-264c-b0592746c123@nvidia.com> <CAMRc=MfMdMJXS1Yh_T-Ke+0U3ZC-oZhb2hJqb_g1wgO2s+7JAQ@mail.gmail.com>
 <2fd6d2a4-d8a4-f763-2f31-00709c7d3603@nvidia.com>
In-Reply-To: <2fd6d2a4-d8a4-f763-2f31-00709c7d3603@nvidia.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 28 Sep 2023 20:34:34 +0200
Message-ID: <CAMRc=Me+k1UbjF6Hn1+gOGiNoZb4UZ444S7me4AOiw2VOLMp1g@mail.gmail.com>
Subject: Re: [PATCH] hte: allow building modules with COMPILE_TEST enabled
To: Dipen Patel <dipenp@nvidia.com>
Cc: timestamp@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 28, 2023 at 7:36=E2=80=AFPM Dipen Patel <dipenp@nvidia.com> wro=
te:
>
> On 9/27/23 11:53 PM, Bartosz Golaszewski wrote:
> > On Thu, Sep 28, 2023 at 5:31=E2=80=AFAM Dipen Patel <dipenp@nvidia.com>=
 wrote:
> >>
> >> On 9/25/23 1:37 AM, Bartosz Golaszewski wrote:
> >>> On Mon, Sep 11, 2023 at 11:46=E2=80=AFAM Bartosz Golaszewski <brgl@bg=
dev.pl> wrote:
> >>>>
> >>>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >>>>
> >>>> Allow building all HTE modules with COMPILE_TEST Kconfig option enab=
led.
> >>>>
> >>>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >>>> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> >>>> ---
> >>>> This was part of a wider series but since this is independent, I'm s=
ending
> >>>> it separately.
> >>>>
> >>>>  drivers/hte/Kconfig | 4 ++--
> >>>>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>>>
> >>>> diff --git a/drivers/hte/Kconfig b/drivers/hte/Kconfig
> >>>> index cf29e0218bae..083e67492bf2 100644
> >>>> --- a/drivers/hte/Kconfig
> >>>> +++ b/drivers/hte/Kconfig
> >>>> @@ -16,7 +16,7 @@ if HTE
> >>>>
> >>>>  config HTE_TEGRA194
> >>>>         tristate "NVIDIA Tegra194 HTE Support"
> >>>> -       depends on ARCH_TEGRA_194_SOC
> >>>> +       depends on (ARCH_TEGRA_194_SOC || COMPILE_TEST)
> >>>>         help
> >>>>           Enable this option for integrated hardware timestamping en=
gine also
> >>>>           known as generic timestamping engine (GTE) support on NVID=
IA Tegra194
> >>>> @@ -25,7 +25,7 @@ config HTE_TEGRA194
> >>>>
> >>>>  config HTE_TEGRA194_TEST
> >>>>          tristate "NVIDIA Tegra194 HTE Test"
> >>>> -        depends on HTE_TEGRA194
> >>>> +        depends on (HTE_TEGRA194 || COMPILE_TEST)
> >>>>          help
> >>>>           The NVIDIA Tegra194 GTE test driver demonstrates how to us=
e HTE
> >>>>           framework to timestamp GPIO and LIC IRQ lines.
> >>>> --
> >>>> 2.39.2
> >>>>
> >>>
> >>> Hi Dipen!
> >>>
> >>> Any comments on this, the other patch with a comment update as well a=
s
> >>> the one addressing usage of gpiochip_find() in HTE drivers?
> >> Sorry for the late response, This looks good to me. I will review and =
test
> >> rest other patches.
> >>
> >>>
> >>> Bart
> >> Acked-by: Dipen Patel <dipenp@nvidia.com>
> >
> > Do you want me to take it through the GPIO tree or your own? Either
> > way no GPIO patches depend on it.
> This patch I should be able to push, assuming it is for 6.7 timeframe. Do=
 other HTE patches depend on
> any of your GPIO patches?
>
> >
> > Bart
>

Only this one needs GPIO changes:

    https://lore.kernel.org/lkml/20230905185309.131295-15-brgl@bgdev.pl/

Bart
