Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55C2A32
	for <timestamp@lists.linux.dev>; Wed,  6 Sep 2023 14:56:24 +0000 (UTC)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-49032a0ff13so1268371e0c.0
        for <timestamp@lists.linux.dev>; Wed, 06 Sep 2023 07:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1694012183; x=1694616983; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0b+LrhpzD5zlDQ1f5MsWSMzQeSCCSm94gfnG0eru8no=;
        b=ga/DhzhjqRkzDHmi7R50jYm1TdmSOzPN2b5HLp75P8CZPoGAFfZ0s84saSPxDl42oo
         a6P8BDOA9qnJUNQmTTH59ThRyhoKatM+L8wmJRygjE5YDUXq8hPLI1dNL2y2zgjRDhw+
         S6QuF6xE1IgXnwqmPeZEtedpXYlGv65nuE2Lx1RrAELr6ll/ZnB940HZvPpvZHhmNw3Z
         z1mUyZZzicfVkjiLGCTzodb0VzTnkUCDVGeZ5SKHst9YSZUG6tM4Jh6DNvhTYo9vmSvb
         asNrfoBzqy5sqY76k6HtGOA+xmVCk5WmiV43LvUbZ6X5ecg0ibMAP98DpY4HBop1kFeO
         OUWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694012183; x=1694616983;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0b+LrhpzD5zlDQ1f5MsWSMzQeSCCSm94gfnG0eru8no=;
        b=MjvTN3MXZgPd2A6doTf4WUJXNRDYTUWDT1OO5DYcSf/pS3qhVoLuDczkSzfVcuhChO
         hcLzp+f1WcvYwUMiBLenq4c0qIzjQqxBtaQ9B1YcM3abGSAmqgBTPVNElzeTjVbzrk6J
         59XOCaOsMBbJCEYWrCugIfOjOouAB9L5H9HrQDXQq0+C+3OscKqGfmbb9AcYRIAcfTmW
         wvjb0LVdUyQy5O1yvjdZey9uFfkfyrNi4w5KoXlXCz25uVAoqYsZWhCDAbsfL+bg/Ude
         0wXNN5adqjgiI6K6XkACMxP0cCv8EZdijdMLmdl17Yq4OvA+hTKKMLty1kDmCTEgKlpf
         lKiw==
X-Gm-Message-State: AOJu0YxgAAo7iSdtIQUVKwXwyHP/IyLJgbKybHTg59rN68qgFCXVh1Xp
	mhJUEVq+AOQtF2mZTV3I6706CifL6PHSVxDuX9vexw==
X-Google-Smtp-Source: AGHT+IHFUAaQuXJCvoaHz5cxhv0bEhMufwh67QZ6cCxl5kH6KvbUhYeVa6KPRbL1zs6bpPHq6Ld1E0a7yk+msYaoihA=
X-Received: by 2002:a1f:e402:0:b0:48d:2a1:5d26 with SMTP id
 b2-20020a1fe402000000b0048d02a15d26mr3439732vkh.4.1694012182436; Wed, 06 Sep
 2023 07:56:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-16-brgl@bgdev.pl>
 <ZPiRTfN3ZbvcuE6I@smile.fi.intel.com>
In-Reply-To: <ZPiRTfN3ZbvcuE6I@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 6 Sep 2023 16:56:11 +0200
Message-ID: <CAMRc=Md3gRyfizGxkGwCUhO1ahkgew5qURueKbJNmkBJJn7=EA@mail.gmail.com>
Subject: Re: [RFT PATCH 15/21] arm: omap1: ams-delta: stop using gpiochip_find()
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

On Wed, Sep 6, 2023 at 4:50=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Sep 05, 2023 at 08:53:03PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > gpiochip_find() is going away as it's not hot-unplug safe. This platfor=
m
> > is not affected by any of the related problems as this GPIO controller
> > cannot really go away but in order to finally remove this function, we
> > need to convert it to using gpio_device_find() as well.
>
> Side question, have you used --patience when preparing this series?
>

Yes! Thanks for bringing it to my attention.

Bart
