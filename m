Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA538C2CA
	for <timestamp@lists.linux.dev>; Mon, 11 Sep 2023 13:14:54 +0000 (UTC)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-44ee3a547adso1722978137.2
        for <timestamp@lists.linux.dev>; Mon, 11 Sep 2023 06:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1694438093; x=1695042893; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RmHlHXBKieO1ptu2ldznM8ZuZhTbj+/naN6JcvAFLCM=;
        b=ZicILxF5D42iSBEZOFWJcGaIcHvB3LkCHIqSYvjhGi+Kui0aGlwuZlFNViajrPNQkF
         m2qFEQDc0ULpagvvjwSdLQ05ILDb534Sxv5b8PqDXVckMGCTI37Of6ITYbP6owVysWzA
         J98df9IvF4QpuCGILUjuOmElUhMp5mN0NWahRMNPPA/IwcDJJmX8U7sfGhWRHA+76BRL
         YglTGrTlACfD//rlaIe17uOHQkrw6G685eNk4n4YrS+4yBhRjOmypv2UiqzWATYbNyJi
         nZiQ6sv7YV1vq7D6jp7MR+RbM0EUJbkYksO33wVA4gCvjpRcyW9KODmJB5/gAt+mCqEL
         VdRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694438094; x=1695042894;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RmHlHXBKieO1ptu2ldznM8ZuZhTbj+/naN6JcvAFLCM=;
        b=aIweyDLaA7LFJxTM24UH30LqvhCsfQgtOYwTPB0qoyKwNQ1YN3frK1yDc6P4NzUqaU
         awDTabFh1eGGJv2h3rdUSsCX5hTW+rwQhgFZi/Jg4LBHN/EpgYPLhT0i/AXyllIviQN1
         1q3w4uiaaX30LJjbYRyLErS+b8sVjp0as9Adb41qSXFnDSzu8SsMjjagxxpODzGvzu4u
         J7tlM6vi52QRTJy8lvPurAvojM4GzdEYaz9Y46Ylg+AB07W6sZVng3MrZVuzS32Khegx
         btku6oTNbzUHJEsNMwqz+I1wYFJvIg+N1if2O446inGs89GKXbXd3uFZSOPwZhNi4VQY
         Ztmg==
X-Gm-Message-State: AOJu0YwDvjwVf5sm4GI6siUYOCzEG1jFWTBhsMTwik4Q+RFf+x+DqnWv
	nfW8l7b0Y/C6WjoOscjZT7lqQ22F6NCuGu+OoFt5uw==
X-Google-Smtp-Source: AGHT+IGbBUp7apcBf0Wo94rPuei/uMCOLdfymAUYtbXkWV6tuJHuzpKRqe3xeH+LKJOYB5mMHTLfbCwIf2IHKGe4l8I=
X-Received: by 2002:a67:fe92:0:b0:44d:5a92:ec45 with SMTP id
 b18-20020a67fe92000000b0044d5a92ec45mr8588355vsr.23.1694438093755; Mon, 11
 Sep 2023 06:14:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-3-brgl@bgdev.pl>
 <ZPiISpLoVx35PuYc@smile.fi.intel.com>
In-Reply-To: <ZPiISpLoVx35PuYc@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 11 Sep 2023 15:14:42 +0200
Message-ID: <CAMRc=MfLGZNmQT55dtrLuqsKbfXjTn7kqOm029oJrOnH002wBw@mail.gmail.com>
Subject: Re: [PATCH 02/21] gpiolib: provide gpio_device_find()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Dipen Patel <dipenp@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Hans de Goede <hdegoede@redhat.com>, 
	Mark Gross <markgross@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org, 
	timestamp@lists.linux.dev, linux-tegra@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 6, 2023 at 4:10=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Sep 05, 2023 at 08:52:50PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > gpiochip_find() is wrong and its kernel doc is misleading as the
> > function doesn't return a reference to the gpio_chip but just a raw
> > pointer. The chip itself is not guaranteed to stay alive, in fact it ca=
n
> > be deleted at any point. Also: other than GPIO drivers themselves,
> > nobody else has any business accessing gpio_chip structs.
> >
> > Provide a new gpio_device_find() function that returns a real reference
> > to the opaque gpio_device structure that is guaranteed to stay alive fo=
r
> > as long as there are active users of it.
>
> ...
>
> > +/**
> > + * gpio_device_find() - find a specific GPIO device
> > + * @data: data to pass to match function
> > + * @match: Callback function to check gpio_chip
>
> > + * Returns:
> > + * New reference to struct gpio_device.
>
> I believe this is wrong location of the Return section.
> AFAIU how kernel doc uses section markers, this entire description become=
s
> a Return(s) section. Have you tried to render man/html/pdf and see this?
>

Yes, it works just fine. Try for yourself: scripts/kernel-doc -rst
drivers/gpio/gpiolib.c

Bart

> > + * Similar to bus_find_device(). It returns a reference to a gpio_devi=
ce as
> > + * determined by a user supplied @match callback. The callback should =
return
> > + * 0 if the device doesn't match and non-zero if it does. If the callb=
ack
> > + * returns non-zero, this function will return to the caller and not i=
terate
> > + * over any more gpio_devices.
> > + *
> > + * The callback takes the GPIO chip structure as argument. During the =
execution
> > + * of the callback function the chip is protected from being freed. TO=
DO: This
> > + * actually has yet to be implemented.
> > + *
> > + * If the function returns non-NULL, the returned reference must be fr=
eed by
> > + * the caller using gpio_device_put().
> > + */
> > +struct gpio_device *gpio_device_find(void *data,
>
> > +                                  int (*match)(struct gpio_chip *gc,
> > +                                               void *data))
>
> One line?
> Or maybe a type for it? (gpio_match_fn, for example)
>
> > +{
> > +     struct gpio_device *gdev;
> > +
> > +     guard(spinlock_irqsave)(&gpio_lock);
> > +
> > +     list_for_each_entry(gdev, &gpio_devices, list) {
> > +             if (gdev->chip && match(gdev->chip, data))
> > +                     return gpio_device_get(gdev);
> > +     }
> > +
> > +     return NULL;
> > +}
>
> ...
>
> > +struct gpio_device *gpio_device_find(void *data,
> > +                                  int (*match)(struct gpio_chip *gc,
> > +                                               void *data));
>
> Ditto.
>
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
