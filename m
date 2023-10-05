Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6683FB18
	for <timestamp@lists.linux.dev>; Thu,  5 Oct 2023 19:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="LlL9pqzw"
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-49ab0641e77so553710e0c.0
        for <timestamp@lists.linux.dev>; Thu, 05 Oct 2023 12:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696532745; x=1697137545; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B2BbXZ6zku6CreVtFbsfProDFvSQWLPs41LvEjW0tpg=;
        b=LlL9pqzwfbeoEks+NwvUeyPQhOmBdbd9hyNEdpfxdcnfSg6G9nsq1NMFnepxy8D4MW
         3vu3M8UISxCw7x148LMtU17R4gQFgW2mhYISZ7NfTCmqnENleBOjwcGyqlbaKKewIBqo
         eduh4EZMprkd9HLETf+dmPDfsCy+EWTpZm7rldsGOQ9WlB4KCpqmVJ7/Htbz5xWFur71
         Zs4oGkeiTFvzVvvpk1ooAYtKtVYJQ/9oykjNofhQPNTM6zT0Dk9aDNEGiset8cS3WFAs
         +Jv7/xMRQeqvMXeNgy6SguXyGtGNZNulScDAJTwHwyD5ZJoKbJDbGpjjL5XPkmKMnpMD
         NHqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696532745; x=1697137545;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B2BbXZ6zku6CreVtFbsfProDFvSQWLPs41LvEjW0tpg=;
        b=UPgq+e84/XCI2dMWqfvI1NxaKflyzG+zBNro5af9AYuGoeLdw6jq1CKnHUaRXP1oZT
         0STNrQlHRBJw4yado0pIVUvPdz8tBf27iCKmsSHp05v0ZIAE4TgB5wPVt0iKXUIjzFRc
         KlczMnok3LVJLTId+CJ035wrd/McQ4QLnajHkFrs1PH279zTePK6lc5FPGnGEYSA8N69
         BEvjVXns57nokUzwURYP++mYklNRYD0VMvLdLCuBm1rWBrcwH4R3MrjLy5h8LHG19t4b
         xx/9ME/Rz0yTHBeYoa2mExL2Er+QOzBaj9zwG1i9baAxNK+rZAmtIhKyvUZ53lziLHDc
         CiPg==
X-Gm-Message-State: AOJu0YxUGVrgwafdErEwHQ1pLFmRYuS3/ciyk/7NrTbHFK93flu0Bad9
	ioN0Q8VsQR6nm17iU95VM8NBz7ql/1FNMFu0PcrWGA==
X-Google-Smtp-Source: AGHT+IFe6SFd37UkrZpGqbfP6f8TUUmtnYMwLOeZRRi1PlDtGd19zD8ZNlLAGBosOo8BK2hOHgEkNi7ZAB7ouhMOEdQ=
X-Received: by 2002:a1f:66c3:0:b0:49a:a773:fe80 with SMTP id
 a186-20020a1f66c3000000b0049aa773fe80mr6001000vkc.2.1696532745272; Thu, 05
 Oct 2023 12:05:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-15-brgl@bgdev.pl>
 <CACRpkda9=VULj4Cy_sit-UpUQnVEbS-RJKAeULVCw8ZCRTq1sw@mail.gmail.com>
 <CAMRc=MdTk1B4MEh9C624Upm_EcaQgJd9OU-AGfU0G-DU1+qk6A@mail.gmail.com>
 <36b17290-c643-8d8e-e82b-49afa6b34fbb@nvidia.com> <3624e973-d09a-d211-c6d0-d0ffb8c20c4b@nvidia.com>
 <90b5f887-8af4-a80d-ea4d-cf2199752de4@nvidia.com> <0e7cae42-0b81-c038-8beb-49102feea8a6@nvidia.com>
 <CAMRc=McSG6qajxt6P3vWQEeT63Pk5tggD05pUoMD1zd5ApZxgA@mail.gmail.com> <647d3b52-1daf-175d-d5c2-45653dd2604c@nvidia.com>
In-Reply-To: <647d3b52-1daf-175d-d5c2-45653dd2604c@nvidia.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 5 Oct 2023 21:05:34 +0200
Message-ID: <CAMRc=Mc_+LxcbV+=KPwAh4DinJAAetHrK+W3jbNp4AZBzg63TA@mail.gmail.com>
Subject: Re: [RFT PATCH 14/21] hte: tegra194: don't access struct gpio_chip
To: Dipen Patel <dipenp@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
	Russell King <linux@armlinux.org.uk>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-acpi@vger.kernel.org, timestamp@lists.linux.dev, 
	linux-tegra@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 5, 2023 at 8:12=E2=80=AFPM Dipen Patel <dipenp@nvidia.com> wrot=
e:
>
> On 10/5/23 6:48 AM, Bartosz Golaszewski wrote:
> > On Thu, Oct 5, 2023 at 1:52=E2=80=AFAM Dipen Patel <dipenp@nvidia.com> =
wrote:
> >>
> >> On 10/4/23 3:54 PM, Dipen Patel wrote:
> >>> On 10/4/23 1:33 PM, Dipen Patel wrote:
> >>>> On 10/4/23 1:30 PM, Dipen Patel wrote:
> >>>>> On 10/4/23 5:00 AM, Bartosz Golaszewski wrote:
> >>>>>> On Thu, Sep 7, 2023 at 9:28=E2=80=AFAM Linus Walleij <linus.wallei=
j@linaro.org> wrote:
> >>>>>>>
> >>>>>>> On Tue, Sep 5, 2023 at 8:53=E2=80=AFPM Bartosz Golaszewski <brgl@=
bgdev.pl> wrote:
> >>>>>>>
> >>>>>>>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >>>>>>>>
> >>>>>>>> Using struct gpio_chip is not safe as it will disappear if the
> >>>>>>>> underlying driver is unbound for any reason. Switch to using ref=
erence
> >>>>>>>> counted struct gpio_device and its dedicated accessors.
> >>>>>>>>
> >>>>>>>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.o=
rg>
> >>>>>>>
> >>>>>>> As Andy points out add <linux/cleanup.h>, with that fixed:
> >>>>>>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> >>>>>>>
> >>>>>>> I think this can be merged into the gpio tree after leaving some
> >>>>>>> slack for the HTE maintainer to look at it, things look so much
> >>>>>>> better after this.
> >>>>>>>
> >>>>>>> Yours,
> >>>>>>> Linus Walleij
> >>>>>>
> >>>>>> Dipen,
> >>>>>>
> >>>>>> if you could give this patch a test and possibly ack it for me to =
take
> >>>>>> it through the GPIO tree (or go the immutable tag from HTE route) =
then
> >>>>>> it would be great. This is the last user of gpiochip_find() treewi=
de,
> >>>>>> so with it we could remove it entirely for v6.7.
> >>>>>
> >>>>> Progress so far for the RFT...
> >>>>>
> >>>>> I tried applying the patch series on 6.6-rc1 and it did not apply c=
leanly,
> >>>>> some patches I needed to manually apply and correct. With all this,=
 it failed
> >>>>> compilation at some spi/spi-bcm2835 driver. I disabled that and was=
 able to
> >>>>> compile. I thought I should let you know this part.
> >>>>>
> >>>>> Now, I tried to test the hte and it seems to fail finding the gpio =
device,
> >>>>> roughly around this place [1]. I thought it would be your patch ser=
ies so
> >>>>> tried to just use 6.6rc1 without your patches and it still failed a=
t the
> >>>>> same place. I have to trace back now from which kernel version it b=
roke.
> >>>>
> >>>> [1].
> >>>> https://git.kernel.org/pub/scm/linux/kernel/git/pateldipen1984/linux=
.git/tree/drivers/hte/hte-tegra194.c?h=3Dfor-next#n781
> >>>>
> >>>> of course with your patches it would fail for the gdev instead of th=
e chip.
> >>>
> >>> Small update:
> >>>
> >>> I put some debugging prints in the gpio match function in the hte-teg=
ra194.c as
> >>> below:
> >>>
> >>> static int tegra_gpiochip_match(struct gpio_chip *chip, void *data)
> >>>  {
> >>> +       struct device_node *node =3D data;
> >>> +       struct fwnode_handle *fw =3D of_node_to_fwnode(data);
> >>> +       if (!fw || !chip->fwnode)
> >>> +               pr_err("dipen patel: fw is null\n");
> >>>
> >>> -       pr_err("%s:%d\n", __func__, __LINE__);
> >>> +       pr_err("dipen patel, %s:%d: %s, %s, %s, match?:%d, fwnode nam=
e:%s\n",
> >>> __func__, __LINE__, chip->label, node->name, node->full_name, (chip->=
fwnode =3D=3D
> >>> fw), fw->dev->init_name);
> >>>         return chip->fwnode =3D=3D of_node_to_fwnode(data);
> >>>  }
> >>>
> >>> The output of the printfs looks like below:
> >>> [    3.955194] dipen patel: fw is null -----> this message started ap=
pearing
> >>> when I added !chip->fwnode test in the if condition line.
> >>>
> >>> [    3.958864] dipen patel, tegra_gpiochip_match:689: tegra234-gpio, =
gpio,
> >>> gpio@c2f0000, match?:0, fwnode name:(null)
> >>>
> >>> I conclude that chip->fwnode is empty. Any idea in which conditions t=
hat node
> >>> would be empty?
> >>
> >> sorry for spamming, one last message before I sign off for the day....
> >>
> >> Seems, adding below in the tegra gpio driver resolved the issue I am f=
acing, I
> >> was able to verify your patch series.
> >>
> >> diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186=
.c
> >> index d87dd06db40d..a56c159d7136 100644
> >> --- a/drivers/gpio/gpio-tegra186.c
> >> +++ b/drivers/gpio/gpio-tegra186.c
> >> @@ -989,6 +989,8 @@ static int tegra186_gpio_probe(struct platform_dev=
ice *pdev)
> >>                 offset +=3D port->pins;
> >>         }
> >>
> >> +       gpio->gpio.fwnode =3D of_node_to_fwnode(pdev->dev.of_node);
> >> +
> >>         return devm_gpiochip_add_data(&pdev->dev, &gpio->gpio, gpio);
> >>  }
> >>
> >> Now, few follow up questions:
> >> 1) is this the correct way of setting the chip fwnode in the gpio driv=
er?
> >
> > You shouldn't need this. This driver already does:
> >
> >     gpio->gpio.parent =3D &pdev->dev;
> >
> > so fwnode should be assigned in gpiochip_add_data_with_key(). Can you
> > check why this doesn't happen?
>
> I do not see anywhere chip->fwnode being set in the gpiochip_add_* functi=
on.
> The only reference I see is here [1]. Does it mean I need to change my ma=
tch
> function from:
>
> chip->fwnode =3D=3D of_node_to_fwnode(data)
>
> to:
> dev_fwnode(chip->parent) =3D=3D of_node_to_fwnode(data)?

No! chip->fwnode is only used to let GPIOLIB know which fwnode to
assign to the GPIO device (struct gpio_device).

Bart

>
> [1]:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/d=
rivers/gpio/gpiolib.c?h=3Dv6.6-rc1#n767
>
> >
> > Bart
> >
> >> 2) Or should I use something else in hte matching function instead of =
fwnode so
> >> to avoid adding above line in the gpio driver?
> >>
> >>>
> >>>>>
> >>>>>>
> >>>>>> Bart
> >>>>>
> >>>>
> >>>
> >>
>
