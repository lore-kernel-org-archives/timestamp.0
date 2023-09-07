Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33909136B
	for <timestamp@lists.linux.dev>; Thu,  7 Sep 2023 07:19:22 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-d77ad095e5cso642743276.0
        for <timestamp@lists.linux.dev>; Thu, 07 Sep 2023 00:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694071162; x=1694675962; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IXtSDuwLHBAGfIvJXN98Bc/TjY2BpOjtqu3XNPdnEAg=;
        b=WlNd/Gy2ImG8IjkWedyJBGnjG0DnLQY8l3du3TCqvwBXV4nC4NHA97edP3ICkr8eZY
         jfEIJeqvCDvvBKOJCnfhHM1fvtrG+meRdn39NFA8ThdIa8N5fGzav6cc+2IAuS1PzIWc
         Me5q8dM1w8M8FcCWJZJ+sTqEgjCeTgGlSvLKBgkyZqE35seFnQiWnAYx8N/6ptOa/tvF
         NYkTFXFC1lPqH05MW1dbAflq4YVmKqgbsknrLLdIB42Zq7oHoSK4rH878neprXjNg1mn
         cLKUG7R8t2vPmHqnVrUvWAHf/rSaFKJz/ps79ajHzK+SqLFTg0pvTPBqsI33riSTrmVu
         4B2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694071162; x=1694675962;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IXtSDuwLHBAGfIvJXN98Bc/TjY2BpOjtqu3XNPdnEAg=;
        b=NkwbiWG+cTFkWY4cATYxhcQ3CQIENGmqkFoM8V6F1dBzRJ/UkANTvmFObwUDEjVzkM
         Jxw8eUrVUj+d1+wHnN0wE+W7l2a/lazAHPI5dhxKoATUYGGITIB7Eatmne56Q3Oc2Dx6
         n86N1F8SdZRSFKb8WYowtvJv7V1JrbyED2XMgJBEImGttKjElzdq3JpOnZ1TiOa4WGp+
         xW/OJEE9VIosGT1na2ujx3wFvx1U5kNGnObw09PBj5dQwsppT6UiccZaLV9XeXSZQTwa
         hdzR+g0ITuCWAA48TxYWVwLwfTaqcjJwKU+iEW73GRBBXfuxZZhfQ5jVNW1yxJ7S7RDl
         /ejw==
X-Gm-Message-State: AOJu0YyMVktjnOttoDdKOqbIB1nxrOLjeYffQWsswJB/ZtSy9L7dHIvm
	YoPUS5kl9OPbjUkiEOYyh2DvcRjR0KEC2rXMxU01iQ==
X-Google-Smtp-Source: AGHT+IFBssMxe62b6gjC3N4aS6mxtu2dG9GSPKFawDHtfKqDxWyo3xiYEaVk7D6s0DhtiZ21qOVsU28YZ+Ws9GvtAJ0=
X-Received: by 2002:a5b:791:0:b0:d1f:6886:854a with SMTP id
 b17-20020a5b0791000000b00d1f6886854amr17648637ybq.9.1694071162023; Thu, 07
 Sep 2023 00:19:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-10-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-10-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 7 Sep 2023 09:19:09 +0200
Message-ID: <CACRpkdazRyhqHhH+Ock3U0wFRkd_U5QUTZmOeTFoXx-Pe_jCRw@mail.gmail.com>
Subject: Re: [PATCH 09/21] gpiolib: reluctantly provide gpio_device_get_chip()
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Dipen Patel <dipenp@nvidia.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-acpi@vger.kernel.org, timestamp@lists.linux.dev, 
	linux-tegra@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 5, 2023 at 8:53=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> The process of converting all unauthorized users of struct gpio_chip to
> using dedicated struct gpio_device function will be long so in the
> meantime we must provide a way of retrieving the pointer to struct
> gpio_chip from a GPIO device.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Yeah, sigh. Maybe add a notice to drivers/gpio/TODO that this needs
to happen long time.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
