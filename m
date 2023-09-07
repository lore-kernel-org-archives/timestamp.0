Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52273EDA
	for <timestamp@lists.linux.dev>; Thu,  7 Sep 2023 07:05:34 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-d7b9de8139fso526227276.1
        for <timestamp@lists.linux.dev>; Thu, 07 Sep 2023 00:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694070333; x=1694675133; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UdWsNUufxYU54d2v+3Wxi5MrfQGJIJLOBq5vhtohyVg=;
        b=EH/24ZRSGQiQgsTldfM49qUloTq6k1sMcecMnJiANF1ASFuX2VI+qyRuDG2McZ804N
         oQm2sTMrg+McP7Qz510O+7bKGarYfKcWkjF392WYFy/1E4+rfN9W1tV1BRHT3S5AkWHf
         KFvZNpkglyvf9+g00I6itZ7y5Tx/O9b2l7K6kAQTm9lcV9vhu/I00WfSwed4Av31C6fG
         7Am2pLGIIL5olJpJQPzAiavdf7Kk7BOlHNKnL2bTL0ou36azMTVxBm2DE1hlX6jS8Yj3
         JMqL3xZSgsbDrs3F8ixjma5db59nXiTSekpFA4fJ2NnWvuGbFnFnUi7c4yNa52lGOusB
         4Cow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694070333; x=1694675133;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UdWsNUufxYU54d2v+3Wxi5MrfQGJIJLOBq5vhtohyVg=;
        b=XNifAYYTHdHO7Zq/gG/Od/QU6gkb7jehRwzmZUgBHLXxPrgh4ODo+wC0YJQrqT89hK
         rHyTHUCj5FJYGHW9qdwDBRFsurkUFNrAttMsDlMW4dBfAyVtPL1Upn+lC3ixmFSKXflz
         bPLHeSiNTJcRMxJ16aL8hpVMXDuweZCh+jFIPUdsyuE9Ev0ARW+hmDmXWq4YEe6ahtH9
         qtbV9LeFJ4S1hoYnaTlCg3LKJYjZnDcgTMGBLioZbznoX2f3VemEZUZVKm5TE1sM7oeR
         ti8JXPPwuL7plVLJHBZQ/4sJIhavUXNtBEK/0gTRtWLehBalcZBdZsKYFN7FCID0YiyB
         GvVw==
X-Gm-Message-State: AOJu0Yx5TPns+aYsKdlVvrZ7z119bemsT4Ys45dbXyipexFkrG+hHrQq
	cDrjtUU7cKnFxMFgu2sHTbb0K/2CLS7Wc66LbW/JCA==
X-Google-Smtp-Source: AGHT+IGMY/aPJYeBu1Pp0IzmGxqtgA0g7tRf3VGot5Pdq6hh1Y77T4EpHI+nXikBBcDxY/Os4mlIAHH2bnKyBxN7wMo=
X-Received: by 2002:a25:258f:0:b0:d7a:edf3:f0a9 with SMTP id
 l137-20020a25258f000000b00d7aedf3f0a9mr17868648ybl.50.1694070333187; Thu, 07
 Sep 2023 00:05:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-3-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-3-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 7 Sep 2023 09:05:22 +0200
Message-ID: <CACRpkdZEphqvwpid7QzXuYX79q2==58eKT7wg9Cmr8m1FLOuRA@mail.gmail.com>
Subject: Re: [PATCH 02/21] gpiolib: provide gpio_device_find()
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
> gpiochip_find() is wrong and its kernel doc is misleading as the
> function doesn't return a reference to the gpio_chip but just a raw
> pointer. The chip itself is not guaranteed to stay alive, in fact it can
> be deleted at any point. Also: other than GPIO drivers themselves,
> nobody else has any business accessing gpio_chip structs.
>
> Provide a new gpio_device_find() function that returns a real reference
> to the opaque gpio_device structure that is guaranteed to stay alive for
> as long as there are active users of it.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
