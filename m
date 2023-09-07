Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8A41116
	for <timestamp@lists.linux.dev>; Thu,  7 Sep 2023 07:28:29 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-d7f1bc4ece3so612367276.1
        for <timestamp@lists.linux.dev>; Thu, 07 Sep 2023 00:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694071709; x=1694676509; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2QUcdjgXxrS+bTKkF3r2QRe+Cc9aRk/mkNDQCAPj22c=;
        b=IVEd/98qyJSkG5hzNf4rxTG/bWBqL/NK/0J91D9BWbBw9k6fxD5mWRG7ND5IauLtie
         d8JCMZlrwr5qFkmSaweolSnCSJFEBl5SPucrszkKR55j1YX9rTIw0XHeuRPXbaAfV++j
         Nl5dCQqSZQmJPtNWwBwKp6s5YwJpOAzshylh0n3Fj80q/hyjsDEUrsk5gro70HoNKcHl
         Z3DsnUmVm57VypqVp3va/kWlOL0kVhNh8ffWS55lUcg+b9bYkT21TfVTO3ICKOjYW7a3
         tRF/t1I7xQ2gVuJv8TQPh70xYvPU5utpSJ2WeuD6Hi9pQ/hS8fU82/Hlxtk9nro3jZpQ
         3XIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694071709; x=1694676509;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2QUcdjgXxrS+bTKkF3r2QRe+Cc9aRk/mkNDQCAPj22c=;
        b=lpWcaNCQXxvLG9as7Xyuu1w+34zSgADqzXdbWczGFNXt2Ii1vcIWNRfVrfHeQKopId
         h0XwZ6Jyg4qx+ltRuV6SwKRFzv6ffgOj5q7wJJZXnewdwPXffts97RaUhm3mv1bRDOOn
         GTS9BUjlUbuwk77IfMon7hl7VMZnQrX7Wg8zndBIdFcdNO8e3wiEvkv7G3U0b/XTzdpC
         J/+hd2cjbls2c9GM7sj2Y9lLqbLdE0TtsdjvcteqM/Ji0HBODUptpP2gtKj8OSIBXFcS
         dUeRT2CGv4FrDjNUsHMhqTX5G1bLG6kgTpVRbZtUtLBAIOxEB4AJXHV6ODl8ZUR0pCbA
         mQHA==
X-Gm-Message-State: AOJu0Ywm9XHHvU8mf+950e8D4SWNgxGQ8rWzioc3q3wpSB6nWyWxMmFz
	5R5WtCmL4SIdd4+eZyRWdzRHHvrecfh0aKhla1ZTdg==
X-Google-Smtp-Source: AGHT+IG2TLQ2WqAfuGI+vTl02pQSFPJWDZVOY1MfvYV7hKobdzNo0vRGz8kywS9VyDIIMdmuzYR3qPmWC3h4lMZlj/s=
X-Received: by 2002:a25:dc81:0:b0:d7b:9a5d:37c with SMTP id
 y123-20020a25dc81000000b00d7b9a5d037cmr18599620ybe.49.1694071708542; Thu, 07
 Sep 2023 00:28:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-15-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-15-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 7 Sep 2023 09:28:17 +0200
Message-ID: <CACRpkda9=VULj4Cy_sit-UpUQnVEbS-RJKAeULVCw8ZCRTq1sw@mail.gmail.com>
Subject: Re: [RFT PATCH 14/21] hte: tegra194: don't access struct gpio_chip
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
> Using struct gpio_chip is not safe as it will disappear if the
> underlying driver is unbound for any reason. Switch to using reference
> counted struct gpio_device and its dedicated accessors.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

As Andy points out add <linux/cleanup.h>, with that fixed:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I think this can be merged into the gpio tree after leaving some
slack for the HTE maintainer to look at it, things look so much
better after this.

Yours,
Linus Walleij
