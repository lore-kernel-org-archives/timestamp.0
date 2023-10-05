Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9904224F5
	for <timestamp@lists.linux.dev>; Thu,  5 Oct 2023 13:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="L8xgisA4"
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-496d3e18f19so416283e0c.2
        for <timestamp@lists.linux.dev>; Thu, 05 Oct 2023 06:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696513722; x=1697118522; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gHY/ZQQzp7Eh1tubbFWWOn2NxVKU0m/orXkn9/Odof0=;
        b=L8xgisA4ra8dVQDl20tWmz/Ht+jfXJfz7XCAs+apc7fvqBJX5ouFgJoxQWeNi5UScN
         uormP4Z4TAwsFZRPk01ElM+u65b4ohjmIr6WtoMC8n3oKWwUl2dLI+fkn8UuG7uq7cGM
         Fx7UPZ9++q5InqiqLe19Fsf6ECoTsa94nDnembLC8SF94prXBs56AOLDC9waZR+KqB99
         BBKrQxVGyui2QUxn8fCitMhvqTnTH2E5SIsRH6H2LxyTKUnJIRkvbsCSod8FaTVJ7Fqa
         VS8vOwTzGgmcvwE24EaAcsnJKc7+HI73hpSIpSj59sqPN5HQYWD14SYK9Ta9xNQct7Si
         t9Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696513722; x=1697118522;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gHY/ZQQzp7Eh1tubbFWWOn2NxVKU0m/orXkn9/Odof0=;
        b=IvNUfCQNIScHMlM/QyxrS7TmObW0oOjdnA4syoAdyFeEKsAYf1V0VGKWRYVKRmUo7Q
         s5J/ecUYzBVbFmzmSq9D/GmErA1Lv6fzLtlODZSOlxz/tXFS1oSONk1d7k58kWaYuBDD
         g3ID5JgyzEDjvMttVRovoq/HZa5RwymBJropdTM6cExaj+z3rh4qd2g41QWEuQBcJ5ov
         HOWjjqNFOeNvoinADdSOWgd8WqmYvx6TYtWi/VqNb8xUDjiJ0L3T7E8d9L0hACy3zIKq
         JOsDRwhi1A40YXFC9ebf+st2Pio3Rk2ml41Sqs44cu/3H4hbkNS4JM6T2V4pUALarsdr
         bdYQ==
X-Gm-Message-State: AOJu0YxHv21CECms7kvyl29Bi6ufD1nsd9bjQ9doEAEMJh8slPXWX5WT
	WFi28Xmz1WaIgNBTrWkmrMuZiBLQ+TpNw+aSfzLvjw==
X-Google-Smtp-Source: AGHT+IEs24zy6ibJecOnCN0EfrO6wFAW3J5eW9qxeqqcBUsb4ootHwEPnzV2453v5/6B/ux1FD3fv13iIIuy1J493K0=
X-Received: by 2002:a1f:e2c3:0:b0:49c:37a1:2358 with SMTP id
 z186-20020a1fe2c3000000b0049c37a12358mr4560513vkg.14.1696513722632; Thu, 05
 Oct 2023 06:48:42 -0700 (PDT)
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
In-Reply-To: <0e7cae42-0b81-c038-8beb-49102feea8a6@nvidia.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 5 Oct 2023 15:48:31 +0200
Message-ID: <CAMRc=McSG6qajxt6P3vWQEeT63Pk5tggD05pUoMD1zd5ApZxgA@mail.gmail.com>
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

On Thu, Oct 5, 2023 at 1:52=E2=80=AFAM Dipen Patel <dipenp@nvidia.com> wrot=
e:
>
> On 10/4/23 3:54 PM, Dipen Patel wrote:
> > On 10/4/23 1:33 PM, Dipen Patel wrote:
> >> On 10/4/23 1:30 PM, Dipen Patel wrote:
> >>> On 10/4/23 5:00 AM, Bartosz Golaszewski wrote:
> >>>> On Thu, Sep 7, 2023 at 9:28=E2=80=AFAM Linus Walleij <linus.walleij@=
linaro.org> wrote:
> >>>>>
> >>>>> On Tue, Sep 5, 2023 at 8:53=E2=80=AFPM Bartosz Golaszewski <brgl@bg=
dev.pl> wrote:
> >>>>>
> >>>>>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >>>>>>
> >>>>>> Using struct gpio_chip is not safe as it will disappear if the
> >>>>>> underlying driver is unbound for any reason. Switch to using refer=
ence
> >>>>>> counted struct gpio_device and its dedicated accessors.
> >>>>>>
> >>>>>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org=
>
> >>>>>
> >>>>> As Andy points out add <linux/cleanup.h>, with that fixed:
> >>>>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> >>>>>
> >>>>> I think this can be merged into the gpio tree after leaving some
> >>>>> slack for the HTE maintainer to look at it, things look so much
> >>>>> better after this.
> >>>>>
> >>>>> Yours,
> >>>>> Linus Walleij
> >>>>
> >>>> Dipen,
> >>>>
> >>>> if you could give this patch a test and possibly ack it for me to ta=
ke
> >>>> it through the GPIO tree (or go the immutable tag from HTE route) th=
en
> >>>> it would be great. This is the last user of gpiochip_find() treewide=
,
> >>>> so with it we could remove it entirely for v6.7.
> >>>
> >>> Progress so far for the RFT...
> >>>
> >>> I tried applying the patch series on 6.6-rc1 and it did not apply cle=
anly,
> >>> some patches I needed to manually apply and correct. With all this, i=
t failed
> >>> compilation at some spi/spi-bcm2835 driver. I disabled that and was a=
ble to
> >>> compile. I thought I should let you know this part.
> >>>
> >>> Now, I tried to test the hte and it seems to fail finding the gpio de=
vice,
> >>> roughly around this place [1]. I thought it would be your patch serie=
s so
> >>> tried to just use 6.6rc1 without your patches and it still failed at =
the
> >>> same place. I have to trace back now from which kernel version it bro=
ke.
> >>
> >> [1].
> >> https://git.kernel.org/pub/scm/linux/kernel/git/pateldipen1984/linux.g=
it/tree/drivers/hte/hte-tegra194.c?h=3Dfor-next#n781
> >>
> >> of course with your patches it would fail for the gdev instead of the =
chip.
> >
> > Small update:
> >
> > I put some debugging prints in the gpio match function in the hte-tegra=
194.c as
> > below:
> >
> > static int tegra_gpiochip_match(struct gpio_chip *chip, void *data)
> >  {
> > +       struct device_node *node =3D data;
> > +       struct fwnode_handle *fw =3D of_node_to_fwnode(data);
> > +       if (!fw || !chip->fwnode)
> > +               pr_err("dipen patel: fw is null\n");
> >
> > -       pr_err("%s:%d\n", __func__, __LINE__);
> > +       pr_err("dipen patel, %s:%d: %s, %s, %s, match?:%d, fwnode name:=
%s\n",
> > __func__, __LINE__, chip->label, node->name, node->full_name, (chip->fw=
node =3D=3D
> > fw), fw->dev->init_name);
> >         return chip->fwnode =3D=3D of_node_to_fwnode(data);
> >  }
> >
> > The output of the printfs looks like below:
> > [    3.955194] dipen patel: fw is null -----> this message started appe=
aring
> > when I added !chip->fwnode test in the if condition line.
> >
> > [    3.958864] dipen patel, tegra_gpiochip_match:689: tegra234-gpio, gp=
io,
> > gpio@c2f0000, match?:0, fwnode name:(null)
> >
> > I conclude that chip->fwnode is empty. Any idea in which conditions tha=
t node
> > would be empty?
>
> sorry for spamming, one last message before I sign off for the day....
>
> Seems, adding below in the tegra gpio driver resolved the issue I am faci=
ng, I
> was able to verify your patch series.
>
> diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
> index d87dd06db40d..a56c159d7136 100644
> --- a/drivers/gpio/gpio-tegra186.c
> +++ b/drivers/gpio/gpio-tegra186.c
> @@ -989,6 +989,8 @@ static int tegra186_gpio_probe(struct platform_device=
 *pdev)
>                 offset +=3D port->pins;
>         }
>
> +       gpio->gpio.fwnode =3D of_node_to_fwnode(pdev->dev.of_node);
> +
>         return devm_gpiochip_add_data(&pdev->dev, &gpio->gpio, gpio);
>  }
>
> Now, few follow up questions:
> 1) is this the correct way of setting the chip fwnode in the gpio driver?

You shouldn't need this. This driver already does:

    gpio->gpio.parent =3D &pdev->dev;

so fwnode should be assigned in gpiochip_add_data_with_key(). Can you
check why this doesn't happen?

Bart

> 2) Or should I use something else in hte matching function instead of fwn=
ode so
> to avoid adding above line in the gpio driver?
>
> >
> >>>
> >>>>
> >>>> Bart
> >>>
> >>
> >
>
