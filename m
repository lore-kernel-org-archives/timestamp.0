Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F051E8467
	for <timestamp@lists.linux.dev>; Thu, 28 Sep 2023 06:53:40 +0000 (UTC)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-45289425da1so5184912137.1
        for <timestamp@lists.linux.dev>; Wed, 27 Sep 2023 23:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1695884019; x=1696488819; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xruzTjy5WcrjBjJM07hHvhKt83Q4GJyyiDox0uwU38Q=;
        b=k75+vGGoQOKHlsKL0+XlzkW9b8/w6j6DQhiXAlVSWpUqePhH80POTlm++j/+btAWYJ
         ix3aiGRb2svnt9ulft/FgeQjLsd2FSmp+wfa3WWj12vFvKb3ltMJxT9I0mD6yO5hEMJp
         ljZOGhrMwFwLpTjM0n0F8lZkSEq/u1zCnGHcTUjVowhVchErfbkrvCWMQBtqezaVqYZo
         0PqrIZ9h4sdGIJiawTQDfO3dJurrxr6TGI8y5GLN342mihvfeyi+he49lWqBdqAhaz0x
         ryLs/wyCIPWyaY0Ihi5ph/cqSlcRhkedxfZjjYCvUwjau4bSIABoaDBHzrK8SsgR9vus
         ixyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695884019; x=1696488819;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xruzTjy5WcrjBjJM07hHvhKt83Q4GJyyiDox0uwU38Q=;
        b=p47mxnRbEs8Zb7eQRgbodN76+TOoY5JDSd8W/1W4Xwt8mWahktCPaBHULea6QZtBIe
         rOXadT3GmRnQNQscPrCJsYzlktogQOSzXPnHnZVgOJgzoKh7XISjOoKkZWVsoCaq/qS4
         ssiy8rBFNsAiMobbUjS2R1CezuVanVukCLTc/Ieels4kzyiB0zBdiZlFdY2EC1lIOae2
         dfsaOW/jpJMTbQOdUnvG0OQZigLBPr7sa61eaVFzAzBWMW6caA89TaDa8XXaAQdyBy9l
         4twwKS3EXuHJB16aF2N+JiZK7MSBNfmKU8QWS6q06UT2RjVZL18F8kwnyFGgybRLVM/4
         nruA==
X-Gm-Message-State: AOJu0Yz9sE+vQGD+ZGXb2JPlaDBr3E3DZj8JN8bdSOU1Lv16puFRy1mk
	VKk2fLoxggnoeYpXyq+rGEzaIwuT5vRerEX+C+9gAA==
X-Google-Smtp-Source: AGHT+IGmpqBATbpH3HYGIvHr4Z0rnOb696RLx0AZUozA1C7yBAZM81V3kAkXcXeXka2AnmIqzMZzFqmqtc5v75s2tA0=
X-Received: by 2002:a05:6102:212:b0:44e:9113:ac58 with SMTP id
 z18-20020a056102021200b0044e9113ac58mr207356vsp.6.1695884019642; Wed, 27 Sep
 2023 23:53:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230911094604.14179-1-brgl@bgdev.pl> <CAMRc=Mc2Yo61uivOWHagR2Raxh11dBb=S6jtCDu8_-csX3ozvw@mail.gmail.com>
 <04e28f8a-1393-d991-264c-b0592746c123@nvidia.com>
In-Reply-To: <04e28f8a-1393-d991-264c-b0592746c123@nvidia.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 28 Sep 2023 08:53:28 +0200
Message-ID: <CAMRc=MfMdMJXS1Yh_T-Ke+0U3ZC-oZhb2hJqb_g1wgO2s+7JAQ@mail.gmail.com>
Subject: Re: [PATCH] hte: allow building modules with COMPILE_TEST enabled
To: Dipen Patel <dipenp@nvidia.com>
Cc: timestamp@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 28, 2023 at 5:31=E2=80=AFAM Dipen Patel <dipenp@nvidia.com> wro=
te:
>
> On 9/25/23 1:37 AM, Bartosz Golaszewski wrote:
> > On Mon, Sep 11, 2023 at 11:46=E2=80=AFAM Bartosz Golaszewski <brgl@bgde=
v.pl> wrote:
> >>
> >> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >>
> >> Allow building all HTE modules with COMPILE_TEST Kconfig option enable=
d.
> >>
> >> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> >> ---
> >> This was part of a wider series but since this is independent, I'm sen=
ding
> >> it separately.
> >>
> >>  drivers/hte/Kconfig | 4 ++--
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/hte/Kconfig b/drivers/hte/Kconfig
> >> index cf29e0218bae..083e67492bf2 100644
> >> --- a/drivers/hte/Kconfig
> >> +++ b/drivers/hte/Kconfig
> >> @@ -16,7 +16,7 @@ if HTE
> >>
> >>  config HTE_TEGRA194
> >>         tristate "NVIDIA Tegra194 HTE Support"
> >> -       depends on ARCH_TEGRA_194_SOC
> >> +       depends on (ARCH_TEGRA_194_SOC || COMPILE_TEST)
> >>         help
> >>           Enable this option for integrated hardware timestamping engi=
ne also
> >>           known as generic timestamping engine (GTE) support on NVIDIA=
 Tegra194
> >> @@ -25,7 +25,7 @@ config HTE_TEGRA194
> >>
> >>  config HTE_TEGRA194_TEST
> >>          tristate "NVIDIA Tegra194 HTE Test"
> >> -        depends on HTE_TEGRA194
> >> +        depends on (HTE_TEGRA194 || COMPILE_TEST)
> >>          help
> >>           The NVIDIA Tegra194 GTE test driver demonstrates how to use =
HTE
> >>           framework to timestamp GPIO and LIC IRQ lines.
> >> --
> >> 2.39.2
> >>
> >
> > Hi Dipen!
> >
> > Any comments on this, the other patch with a comment update as well as
> > the one addressing usage of gpiochip_find() in HTE drivers?
> Sorry for the late response, This looks good to me. I will review and tes=
t
> rest other patches.
>
> >
> > Bart
> Acked-by: Dipen Patel <dipenp@nvidia.com>

Do you want me to take it through the GPIO tree or your own? Either
way no GPIO patches depend on it.

Bart
