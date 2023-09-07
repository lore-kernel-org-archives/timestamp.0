Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1889136B
	for <timestamp@lists.linux.dev>; Thu,  7 Sep 2023 07:37:05 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-d7bbaa8efa7so628007276.3
        for <timestamp@lists.linux.dev>; Thu, 07 Sep 2023 00:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694072224; x=1694677024; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9VX520/JAjo5YxFEs6vhZtWf0iQa736VrN0vgqzfoO4=;
        b=CuFz7w41P0K2jGgi+1xL3BkZjeTjMCXwEbgXTiDDN16lGdpFltDYBNvgEsyXtctpj1
         TelQ31NgVkT2asd2vWNk/uQ/NKEUkrTzKAKA0bZWEeEV4cehNR38KE/T0KDK+fcvrqf1
         3BeJOanWeDp57Zd2/ugDlZ0/gGMeHrmivNTq0q/IZViqSSmL930aPZQ+2JSuKba6R93C
         +pP9oJSpftID4jYhrKTNsJ5Zk86G4Is3XERAPwuyOKINT7hYHPtaT8PuBGmNR93IwHw0
         AsrkgF2w/WRrn5jMj1TWL+WUTTXSiveonbzSg/iyBjn8y3c8AUbHHBuk0RY9waDPhcl8
         NwgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694072224; x=1694677024;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9VX520/JAjo5YxFEs6vhZtWf0iQa736VrN0vgqzfoO4=;
        b=l2QiqiPv9+F+pZZEunnwogNrIXVoSZTWYCf1a0IRBx3TIrguY4EcwN7joQ/uBoNY4O
         s7vG9uDbsbi9oZK3u9h46LdffLabCZZsZb4sXoW32zRMHnijVpXyWVPVk7D+2VUQ1BFv
         FMjhXkxCMQtgLa8RUg6XMExVpdRzp76G3sWCQ6pUZQYQge4cL7GukdvDPE0TUvFZUJTm
         dlKIRdn8Nzwh3GIvbfULArgVGBJ431c18tiKkBjhdHQLsMrhA2GSUk+PZc8X2//5EYA3
         W/OaYyWEsXe19uiehZXgE6KeYOmLYjtcIPxWOVcPeHK39ecnvCnLMyilx4h000IAgelr
         vh/A==
X-Gm-Message-State: AOJu0YwZ06uITOGTU7cL42q0Xoj/SpWyOafl4ISdpyDDO+AD2s5P+ooi
	VUYos/qMjqAyglL+895BpOBimqEWIIPdwo8+IU0C5w==
X-Google-Smtp-Source: AGHT+IGsG5hJJbLxB8MJ18cSL64AbAsKmU8HUkb1gvXKq17Y/8ZLDXSkKoAPtcsGb/CfUJGklHIiazXnZYlmi1tiRYs=
X-Received: by 2002:a25:d78a:0:b0:d78:47a:d76e with SMTP id
 o132-20020a25d78a000000b00d78047ad76emr19559951ybg.49.1694072224500; Thu, 07
 Sep 2023 00:37:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-17-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-17-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 7 Sep 2023 09:36:53 +0200
Message-ID: <CACRpkdap-AFmVFG_gtYeGuR5JFLgHQ6i7w6HRwKP4+pu=nd66A@mail.gmail.com>
Subject: Re: [PATCH 16/21] gpio: of: correct notifier return codes
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
> According to the comments in linux/notifier.h, the code to return when a
> notifications is "not for us" is NOTIFY_DONE, not NOTIFY_OK.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

This should just be applied, right? If the notifiers already
went upstream (sorry for my ignorance) then it should be
a Fixes: even.

Yours,
Linus Walleij
