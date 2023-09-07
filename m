Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E6C1116
	for <timestamp@lists.linux.dev>; Thu,  7 Sep 2023 07:41:09 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-5924093a9b2so7011557b3.2
        for <timestamp@lists.linux.dev>; Thu, 07 Sep 2023 00:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694072468; x=1694677268; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UYoxChlU4Q9Xf4jiILAEb1/yHuX3jjQxtu/fJCh6QGo=;
        b=A30P8YGEHf0MGXyRghdicYkReiszxTHGOOI60REwT0aGtDE+QsBC6yNpM1Xzonpzp1
         vUQQG+56sXJIQB2r+EOku9+W9KMogfaZkn12fa/VSAivKvL3FHGiphKQExPW80O2Bl6H
         lZ5aTMxzOPMKnV558r9090S/YfAYELTRu11vURNO/bAPdebdG6SFD5ml1VOA5hnazvGt
         +lZJ1Js1v29fhlBSJGuGTmyDCjXL/MI76LVZBdWfanMlSH3+SVbeT/lqATaSQQG4X5NO
         lH0U7s4ftLc438bRTzv7VfCcOXWR9WO8H810c7NsvY+vh3mHFsJQlGqwCBKR+E3esPtA
         M17g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694072468; x=1694677268;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UYoxChlU4Q9Xf4jiILAEb1/yHuX3jjQxtu/fJCh6QGo=;
        b=KgSQ4G2P/p+wn4MWO/8gc+c0APyrA1bOumFjHZt9mOBvg9J4cvGhJ/7TLuKkKx8hGU
         k+JK0IxtQ8IKkQggCVeKqvRg+epSiHobLD8hE6/aVQ3LmIhX3jGxVPh/KZuVR9b3Z1O1
         CnPYEvTGcoQdjzLlvzIpeznB7xzKFondF0TDTA2sRmrud/c53WUyGOos9ARaYkKuwnNH
         IItd4RI7b5kUcj/zo1JLHAWd/hws5okQuwepmiZHfy94M2cDfDlDVA/AsdPHv/1iFdn5
         xAqbUxA2OCHCXMqXtkSvsN2tB5Kmbr9g+OZ/GQgx6OYTJgjUXVPxBpoKiuakzbWg6ATo
         6F7A==
X-Gm-Message-State: AOJu0YynN1Jgw0pqQ+wxa3GLQBv6Wdv4F2mzVV1G9mpCgzxJV17NUlEE
	AVU5QWjIL0s6y/4/t0yTlRN9SOLCYTzgHd5zOaxN5Q==
X-Google-Smtp-Source: AGHT+IHaxiCnBZm00LuWWUA+a8rnudg+hvum/6YQLw0kwU5o8WTcy0PQZuAfaxNBOQSTfwUYu0m1J/nwQGnmFDsy/5I=
X-Received: by 2002:a25:e6c9:0:b0:d05:fa02:5bf5 with SMTP id
 d192-20020a25e6c9000000b00d05fa025bf5mr19872193ybh.48.1694072468477; Thu, 07
 Sep 2023 00:41:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-21-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-21-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 7 Sep 2023 09:40:57 +0200
Message-ID: <CACRpkdY-DMJAzkjVFx2Jyw6yG76u8cZ61YPUbcCsosN5kZ02Ww@mail.gmail.com>
Subject: Re: [PATCH 20/21] gpio: sysfs: drop the mention of gpiochip_find()
 from sysfs code
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
> We have removed all callers of gpiochip_find() so don't mention it in
> gpiolib-sysfs.c.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
