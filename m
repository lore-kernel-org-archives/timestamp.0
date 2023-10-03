Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D73DDAA
	for <timestamp@lists.linux.dev>; Tue,  3 Oct 2023 08:58:51 +0000 (UTC)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-452962769bdso346101137.3
        for <timestamp@lists.linux.dev>; Tue, 03 Oct 2023 01:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696323530; x=1696928330; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E9grnBhGYN4tR3F3kBytOzLLS9fG/VwUgoWRG+MN0q8=;
        b=dCqKS5KWN4wOX1d2hyn7libOjIlRzdT44vsFDDxItFUhMJWoSqx7AF/YmFLEg0gr3L
         NwwjRseRdae8qV9hIo/1vdPn4RXeW650ZPXa4thvBM818z/xgeUof1bcrozYD/xwPDQq
         BaLLqC1vDaUXSmSlTyN6FueXL8ErOfDnb/X6j7wFrj9aKZ8MZKmzwF4wuS/vb+TDRUUq
         g4gKZIKEtJZ8FQRnvyEd9eNCgz1J/gmQ/2c6LoBEcyyehKDwXuvPz+nlJvNGp5vXDx73
         P24yeJZ82t3Tj3yYNyUtB18ryp78ASShYh/njkZB30OU5PV56HLL0Q6SZmC3pR4eqU1F
         nkiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696323530; x=1696928330;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E9grnBhGYN4tR3F3kBytOzLLS9fG/VwUgoWRG+MN0q8=;
        b=SDGemppnvATDd4lKjXQET0eIqJP0P48uRHGvuH2EI8SngBSCbPByY/QRHmlYzDQN5+
         xVYa+GLsByikofakqJ6eddXy1bwsLhHDkCt4sqsuigbB9HR0RIIVy61ufu5ZcmBQaWHE
         XG0Jq8VxXkeYXwPHx5g3I7wWwG3tH1A9AK4G+6ZFoR1dPNfePNYFtOM21DN9cOMqJSXX
         4/jp27Ldmj4jzBmDN4r/jtR2BKZkB+P8MZ1r7PVA3WmJO14B23BT2kdDn6/3NJU0YgmV
         Kzlu6FqAoR2tbKyBO15ZZ4hknQistWaGWE1D3lL3t9GEiO3YzVixPzIaGRcXqmv1n1DO
         y5PA==
X-Gm-Message-State: AOJu0YyllBBL0NO7aVaiDTVvWYKDvZiLDxSwU6E+xrzkdHtxvKpHj6WJ
	IAoiUAJTlYN9i/AKWpJa3+qskfKb3hDR1entE5xjrQ==
X-Google-Smtp-Source: AGHT+IEYqBcuujG8F8yRDX0mMz4fUo5Zqz+FnZMiLO+cfJoEKOTmOKZqVO6LlvB9IX90o4lBKbnpAWh2fFaPLAbLtl0=
X-Received: by 2002:a05:6102:34c8:b0:44e:d6c3:51d6 with SMTP id
 a8-20020a05610234c800b0044ed6c351d6mr12516312vst.14.1696323530367; Tue, 03
 Oct 2023 01:58:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230911094443.14040-1-brgl@bgdev.pl> <cd4df23c-cc02-6723-e36d-34ca03409e6e@nvidia.com>
 <CAMRc=MeWXapho1bsX9Si5uSx7MWVhpT2cqrv5S+qPo51Ko=Vtg@mail.gmail.com> <7766de61-a046-3e17-1322-28bd7f1e61da@nvidia.com>
In-Reply-To: <7766de61-a046-3e17-1322-28bd7f1e61da@nvidia.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 3 Oct 2023 10:58:39 +0200
Message-ID: <CAMRc=Mfbt0iUbM42zR0ZrBWgbQkctQm3LxwiFFP5dXNuQC-EqA@mail.gmail.com>
Subject: Re: [PATCH] hte: tegra194: improve the GPIO-related comment
To: Dipen Patel <dipenp@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	timestamp@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 2, 2023 at 6:27=E2=80=AFPM Dipen Patel <dipenp@nvidia.com> wrot=
e:
>
> On 10/2/23 1:33 AM, Bartosz Golaszewski wrote:
> > On Fri, Sep 29, 2023 at 11:38=E2=80=AFPM Dipen Patel <dipenp@nvidia.com=
> wrote:
> >>
> >> On 9/11/23 2:44 AM, Bartosz Golaszewski wrote:
> >>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >>>
> >>> Using any of the GPIO interfaces using the global numberspace is
> >>> deprecated. Make it clear in the comment.
> >>>
> >>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >>> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> >>> ---
> >>> This was part of a wider series but since this is independent, I'm se=
nding
> >>> it separately.
> >>>
> >>>  drivers/hte/hte-tegra194.c | 13 ++++++++-----
> >>>  1 file changed, 8 insertions(+), 5 deletions(-)
> >>>
> >>> diff --git a/drivers/hte/hte-tegra194.c b/drivers/hte/hte-tegra194.c
> >>> index 6fe6897047ac..9fd3c00ff695 100644
> >>> --- a/drivers/hte/hte-tegra194.c
> >>> +++ b/drivers/hte/hte-tegra194.c
> >>> @@ -407,12 +407,15 @@ static int tegra_hte_line_xlate(struct hte_chip=
 *gc,
> >>>               return -EINVAL;
> >>>
> >>>       /*
> >>> +      * GPIO consumers can access GPIOs in two ways:
> >>>        *
> >>> -      * There are two paths GPIO consumers can take as follows:
> >>> -      * 1) The consumer (gpiolib-cdev for example) which uses GPIO g=
lobal
> >>> -      * number which gets assigned run time.
> >>> -      * 2) The consumer passing GPIO from the DT which is assigned
> >>> -      * statically for example by using TEGRA194_AON_GPIO gpio DT bi=
nding.
> >>> +      * 1) Using the global GPIO numberspace.
> >>> +      *
> >>> +      * This is the old, now DEPRECATED method and should not be use=
d in
> >>> +      * new code. TODO: Check if tegra is even concerned by this.
> >> This use case is to do namespace mapping from gpio subsystem to hte. F=
ew doubts:
> >> 1. What does deprecate mean here? Does gpio subsys not use global spac=
e anymore?
> >
> > It does but we don't want to expose this to external users in any way
> > anymore (and haven't to for years). This is what deprecated means.
> > Users should deal with opaque GPIO descriptors not global GPIO
> > numberspace.
> >
> >> 2. If yes, what GPIO number is set when it comes from gpiolib-cdev, as=
 based on that I may have to
> >> reflect in the mapping, tegra194_aon_gpio_map for example.
> >
> > Why DO you have to use a GPIO number though? If HTE needs just a
> > number from some HTE numberspace (which in itself may be unnecessary)
> > then why not just keep a local IDA for it? Do you have to know the
> > GPIOs internal numbering scheme to make it work?
>

Dipen,

Please set your mailer to wrap lines around at 80 characters as is
customary on the mailing list.

> humm, overall, I just need to know which GPIO it is, for example, GPIO co=
ntroller X Port A GPIO number 3
> to do proper mapping.
> Continuing from above example, the hte driver gets:
> - GPIO Controller X from DT node
> - the rest details in current code gets it from [1] and [2]
>
> If there is alternate method exists, I would like to explore. I think IDA=
 will not help in this case as ID assigned
> does not hold meaning in this context.
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/drivers/gpio/gpiolib-cdev.c?h=3Dv6.6-rc3#n760

Here: any reason why we have to translate the desc to the global GPIO
numberspace? Can we just pass the descriptor pointer directly to the
HTE subsystem?

> [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/drivers/hte/hte-tegra194.c?h=3Dv6.6-rc3#n421

I still don't understand why you need to know the GPIO base? I'm not
quite sure what the role of line_id is in this driver. Is it only to
index the array?

Please bear with me, I don't know this subsystem very well.

Bart

>
> >
> > Bart
> >
> >>> +      *
> >>> +      * 2) Using GPIO descriptors that can be assigned to consumer d=
evices
> >>> +      * using device-tree, ACPI or lookup tables.
> >>>        *
> >>>        * The code below addresses both the consumer use cases and map=
s into
> >>>        * HTE/GTE namespace.
> >>
>
