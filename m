Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3883C1FA0
	for <timestamp@lists.linux.dev>; Mon,  9 Oct 2023 06:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="NugRHJ+/"
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-49ad8b76003so1463032e0c.3
        for <timestamp@lists.linux.dev>; Sun, 08 Oct 2023 23:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696833904; x=1697438704; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h4yu13CTAk93CAArrQHw56fb0+67aBBNyd2lqpOlVos=;
        b=NugRHJ+/oILq1DVnwJ39mR2FIygJKtIg9JZVYvTxaw2vjHf1dofaGm4hucFQOKBrzC
         E1Kf0wTFGGxHKmdqnCuGtOuPfPpe5dyHq8FnKSTZ/BrslkHyUs2sUszVTvCF6HoJTN9a
         GxUP/d1AjQdUNJIoZv92wV9x98jgeVSWHVWUO9G1KSH1YYD/F0fPsuJGD/BUSh20i7s7
         ioHNs9n1/885SyFOQyzJPvdcmOdQyMByQWgPXOJTLBtD5KsXXNk85oUCEQQiGf36meiq
         mU9WLp0IsFMOKqbMexrx3mRvZwmZFmX3FUgl4sgNoGvzrnFY5kkDTlwTnSmyZ4ZMOrKJ
         /eIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696833904; x=1697438704;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h4yu13CTAk93CAArrQHw56fb0+67aBBNyd2lqpOlVos=;
        b=XuQtzTt0+6qF9TyzOZ/RIXq63USnVVPKthl+a/CC5sfMIxfZs6ZH13gTdVnSF6H/8P
         gg71+g4jLM4wvBKEdA7ux791lcRwEU2KgOP4S7D/lnDPut2Yxz9/cPjJnb8sz7hJiQ7k
         YFbAx1jF8SOzzF6QzQYdPlssNbQXlvdMnojM0iQBj03vbYM2haEl2gNI5IBIcsi75PXp
         0xkQSIp/MRyYYov1U/ZudyZRyDQsKdJ02iGqtclOHsAvMH6frqtHWfEzgAemQihz1FCA
         pYeQQVlXo8FVLlKp24YIuy2Zxnpv5I0QvZ/R6tuRl60sW9cVSDIpgznscOFhn/jOAJzg
         q72g==
X-Gm-Message-State: AOJu0Yx4rPn0J7WbYlss+mdRpATGqsjdkuw557AHGuIm5MNJ70+G9v+h
	AdbcX+ErwZX3LDpg0aOi2SZteYtVBrrmq8iB2N+CTg==
X-Google-Smtp-Source: AGHT+IFwdJ3g2kY1EDQtNRQMEfDoYkKFxUGRHpuNEpFqAeGCorLDyYlPkv4+sRRKBolFWBnTDxdV+apacMAn1KDYvSc=
X-Received: by 2002:a1f:c342:0:b0:49c:79f3:27a4 with SMTP id
 t63-20020a1fc342000000b0049c79f327a4mr11677190vkf.3.1696833903919; Sun, 08
 Oct 2023 23:45:03 -0700 (PDT)
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
Date: Mon, 9 Oct 2023 08:44:52 +0200
Message-ID: <CAMRc=Me1k6hxazSB1Qnh0D6QtLr-LuDxjKkXbYaRzcP+2vXj+w@mail.gmail.com>
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

Hey, can you pick this up into your tree as well?

Thanks,
Bartosz
