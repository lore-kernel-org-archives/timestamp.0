Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A446136B
	for <timestamp@lists.linux.dev>; Thu,  7 Sep 2023 07:38:41 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-d7830c5b20aso856006276.0
        for <timestamp@lists.linux.dev>; Thu, 07 Sep 2023 00:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694072320; x=1694677120; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f20OVJZsVkvgr12m2GLQpGE6nkKLjOApm9F1D76ZYu4=;
        b=PaTi2pQp3weQYb74PbxOOWtK25lZ9nYujbrFbPnMmeiARjtY6qbabv8oSjRlpQ3G1W
         I/X4D4MhPeZtSG1+FBN65e3c7Y9RJ+VpVvWMX/+29bl4lFKbY5+/2smotdZ1Nv4lNFrN
         SNgIcZWVDypg4tHZtprPcW14mPNkaMko8MYAKhrzF948v6ZxhKv3LzPntWTWHgJlqlwN
         P/sGTk3Jv4ngSn/VoilCBOhTxoBGbvZAmJS/QHKfrgje3JSe9M/TyKx93Ql5bq1C/WKw
         8V7zfQkKwrR7gMJNBtvs3I+BSYSSOlx5dQLwlM7P7czhBoEf92nNHhLw8dJP5NifZkDi
         d8xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694072320; x=1694677120;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f20OVJZsVkvgr12m2GLQpGE6nkKLjOApm9F1D76ZYu4=;
        b=jhQxloP/ylqwoGgc9BkHJkDyBmxAt+ouPoHbZKKeRBI2T8MqPP04v2mwxN+NetT9eq
         oqne1W2jpeOq4Mxmm5EXeI9Dux66w7SO3A0XTGTTea52XpLhH0MfW4UDIDjxg3vHC0fr
         N0NEhya+hagvmtnwIfCCF8UOFXYU0Z+T3CAE2+eM5163qu+E+WpIjMb/M0C2uH6SsqWJ
         8e0WG5XhxtbIz8qQHXGT6n7dq422HFB8eFa0hRwNWWRz96UtlEkwwCoTMoxp0V4EZlWL
         6vRefFKR9pvH2WdiGxVf3YyaCPkwaEPLPKfc/zAAgaxzfFm3mLaLgOjsxzKBvuGnN//5
         OCRQ==
X-Gm-Message-State: AOJu0YxoB3P1ZvdefLQz56EfrEcVQDkF+wnhjs8Fm6IlptdZESXi5FjJ
	eJaWtefj1z/JtzUFUJTHsDk0jdWkLeqGB2YobrH34A==
X-Google-Smtp-Source: AGHT+IHeVaENuEkywllarylsoaxFtkX8+wcxLmOt1RC5WvBdIS3BKktFFG9wSU0jnwmUX/wjU0B+ttekv3ZROcdPEGQ=
X-Received: by 2002:a25:f414:0:b0:d73:ed30:1162 with SMTP id
 q20-20020a25f414000000b00d73ed301162mr1939775ybd.28.1694072320536; Thu, 07
 Sep 2023 00:38:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-18-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-18-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 7 Sep 2023 09:38:29 +0200
Message-ID: <CACRpkdZbCjFMytzsF6Sb-6V54J+owk+zJ3oB9ZGCzAdsGwcFOQ@mail.gmail.com>
Subject: Re: [PATCH 17/21] gpio: of: replace gpiochip_find_* with gpio_device_find_*
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

(Sorry for fatfinger reply)

On Tue, Sep 5, 2023 at 8:53=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> We're porting all users of gpiochip_find() to using gpio_device_find().
> Update the OF GPIO code.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Scoped guards, nice!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
