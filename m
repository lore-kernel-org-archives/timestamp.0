Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7605B136B
	for <timestamp@lists.linux.dev>; Thu,  7 Sep 2023 07:39:36 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-d7bae413275so2495379276.0
        for <timestamp@lists.linux.dev>; Thu, 07 Sep 2023 00:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694072375; x=1694677175; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HY2mdAZRDyp8VLACjM3IsJrv/DB/YaVz8BTWDKGc7zo=;
        b=KpVz0ECCB7wPJV/FHnotKUuIgPO8hqjhbzq0dv7WomgWcIYRviWmOHfmSLmuzU95Z2
         ENd/9s5i83YfhwueUMrnYv7MxeKn4chGxX381fXRtP8vuSSadOUngujnm3PezobvBmG/
         zNkohtsdWiYN97rdKB5zzWQJOM9eJaO01tweEs9F48JkvrI5hoqgh6RYuTB8G9imxtsL
         GaVNX3bMiFPA/LMggShehb28jujuC3shmQKNGHWfw5ssuqH3frI1t7mpI/f2p0iqx83i
         0NPct1jpsFQF8McVms59Gp447VIzENG+gd9UMA7sC+tWH57BwrgdTjJrw+xkRm2devTO
         NmRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694072375; x=1694677175;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HY2mdAZRDyp8VLACjM3IsJrv/DB/YaVz8BTWDKGc7zo=;
        b=CKESzHQLOsZuM8wHIuM7WjmtF8gbqbybdKOeP8dgG8xsoaBtCokG+/xwGMo2eMIC8n
         kS+zuO/IEKkyY0/85UrItLmm6ACs+dTTVhARNK4dApGkVM5DlJpku4DHnEK6NCv8zIs2
         WoGc9xf3BTGYatWBiR2ej/Q0QqjwBtSJVhDyeunBNvKjuKoVsFn79xM/u+6hjabrIp/C
         x9kFwlTRUYVSKclmiqjYhf7/l7h1fDxk1z6Tx+gx8H8zqZeeIjFQnG5q+h7Md1UrRTpd
         ZtDLftYQkMCNOPW9j6VnOdnnH/aCcEks8HW38CtgDspfDs9yL/QQ5cc9zY/l9EgSa3BN
         fX/w==
X-Gm-Message-State: AOJu0YwmuULtdrC08sf0sdHVrrIPBuH8Wj+sVtexKJDFBlaJM3tCm1C7
	zo9yiADut7hcoHMCdNyl/eAI0Fppq7V3GCneozO6Gw==
X-Google-Smtp-Source: AGHT+IG0DLNKfUPhB/XHRakKjzQvJdJ2oAW9KHDtArjRFCSpF0Q5z+EJuu/6b8snoqW3fkVGsSaqNy6kxIliPZAjMsU=
X-Received: by 2002:a25:dc04:0:b0:d4a:499d:a881 with SMTP id
 y4-20020a25dc04000000b00d4a499da881mr2163263ybe.9.1694072375343; Thu, 07 Sep
 2023 00:39:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-19-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-19-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 7 Sep 2023 09:39:24 +0200
Message-ID: <CACRpkdYOp5162vhQXBp9FwLZzXnjByYHt8OurK4aUyQmJzgfoA@mail.gmail.com>
Subject: Re: [PATCH 18/21] gpio: acpi: replace gpiochip_find() with gpio_device_find()
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
> We're porting all users of gpiochip_find() to using gpio_device_find().
> Update the ACPI GPIO code.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

With Andy's comment addressed:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
