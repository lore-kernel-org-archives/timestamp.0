Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB98F1102
	for <timestamp@lists.linux.dev>; Thu,  7 Sep 2023 07:02:56 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-d7bb34576b9so562863276.3
        for <timestamp@lists.linux.dev>; Thu, 07 Sep 2023 00:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694070175; x=1694674975; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Cz/9gzupE5TkNJMwQALq93+f7LW0hvWUSZEk1aMybo=;
        b=oC9uA/Aj5t/e1dev06FheYjoy1c96ejcBY0bomTasKiLNZv7RAFGzJTN7SGGPPGWjW
         H56STZTjemDnv8Whg2LS63DfyAEc3srBZsh8PqqCpo0tk8KaFBCBofIE4kE7mk8Jm2Oi
         vj6ZcBlH21MrZvP1nuc0xdlo159jrNSuvUgWrCJeG3Vk+POzVtLCklf7vrQG0cI1vN4R
         5BsVaylKiCz7K8di0YTdEooCMu6Gs6UpqbimHkcXs+SVE+v1by8Rs5Qx+QxhDQfdmf5j
         0LPzbpRNJDvAldNMGuHgIfW0FlEMygnqHHOcJX3M9UwIOesAPb4yY8fFviUj7Mbplq5Y
         txXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694070175; x=1694674975;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Cz/9gzupE5TkNJMwQALq93+f7LW0hvWUSZEk1aMybo=;
        b=Id6uVBjn9EZoP7+4KAD+dTZfPI/AIUyTtGFqTz7nu8dXb3A05U3bMyrTvywvqIit+u
         h0qwv0cBkzWNDtX9XeEVbiBJVIACVRCNYePc+opLlLcfA8bR+H9XMp4wN5Uacy7zm3Fo
         jp7GVwJd4Sf9gRv/ujUrBD6PBHMqK+bI2jle4bCu8YLdKb3Lnj9K3J4M7Rfzxu8FNMmE
         CzontkslhSOhNJpFoeJZQvqgpdE+c0tHyrwVS3wqqnP/9b8gaoN4dReuC6nsZCyA82tt
         BPqQfMmclmWy09FIvyOqGhPFn1xFzesdivfcPL0InMN9Xz2ziVgiPC5uIkz0uvw9dHRQ
         qEOA==
X-Gm-Message-State: AOJu0Yxvjjvg6UEm6zQpWVOzOsTV6VJ9DuHOhiylx6UriYeG707b0NaA
	jxi4/gFltbCeTdyjd1zt2PGEWkmH//eAuc/banLvQQ==
X-Google-Smtp-Source: AGHT+IHhmgzWKTsylHHZ2qSwdCSe8fG9sB+HCDYVng7dujabCyOchOSgbCuVeCZbRiidwPEiAF4MbYeMV3WMB/wKWxY=
X-Received: by 2002:a25:40ce:0:b0:d7a:d628:f69d with SMTP id
 n197-20020a2540ce000000b00d7ad628f69dmr19332220yba.32.1694070175534; Thu, 07
 Sep 2023 00:02:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-2-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-2-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 7 Sep 2023 09:02:44 +0200
Message-ID: <CACRpkdbT25G+KSUOPjgo9BQmPy2_rgXULVM1fpZQDqE+Xcj80g@mail.gmail.com>
Subject: Re: [PATCH 01/21] gpiolib: make gpio_device_get() and
 gpio_device_put() public
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
> In order to start migrating away from accessing struct gpio_chip by
> users other than their owners, let's first make the reference management
> functions for the opaque struct gpio_device public in the driver.h
> header.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
