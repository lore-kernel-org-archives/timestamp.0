Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E604EDA
	for <timestamp@lists.linux.dev>; Thu,  7 Sep 2023 07:10:34 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-d7e87b4a0f2so615011276.0
        for <timestamp@lists.linux.dev>; Thu, 07 Sep 2023 00:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694070633; x=1694675433; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sZM5LCrIIZq6Cza2RJhNNmn9rDXfdqmiDRo4rHF5ssg=;
        b=c0tgj4wGNuMTIu+oDGzuua2nR1eLElN+aBF/+Jd1RIUb2l5MMB/obK7tGG38as7mWz
         IsFyPsoF6jWHs3fZr8F8of1ENkZkVgcbAfnwRq4klVel+ks2UQcwAD9QYgxX61saTv65
         OJTpLjzJyteEa2s7ZgAIHgPBouH+tcuEB0iJIZvdTP7nhms2Ngjyl+rb6KaU3RgePw6s
         VPFXIOnyb8WWmRti7CHDBM1KGR8j2YMG68FWkzKYnaw7ESY27x3K2R0X7QvY6xjKIaVr
         nsz3YIyFNw1fLEPKvyab2XmgVy3+5rGdRBDlGIksYAiZRSbg2KizG/CQB4yt3LQDwE9r
         auLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694070633; x=1694675433;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sZM5LCrIIZq6Cza2RJhNNmn9rDXfdqmiDRo4rHF5ssg=;
        b=Tqjhq+UxgQYqcDU65Qd9wtRo1X+w/AXoj7o3t9ojXURuei0isRnpNfjTr70Y/3Div+
         piXCv18OW0dsnAPlyYxufx93RlsGnc8dJPW4K4p45uU7db5mCLEjCp6+ngYzINJl2s4e
         2VMla3nwzxkJ9tL3mVKanRnkp2oeZXCFV9ejf/AI0Kw5yYdI+GujORIt9CPQ33xxpcxP
         DHfZkO4gZJIcMSonK3qncML07bxDccqmEnerCQor+UYoiARjaiNXznFu6jXbmbk3Z2Ul
         eevauNAw8uVvMA2p4okJrlRc9YQI8VKX1Azl5JQ8/wFk/LjusWzx0ESSsGhnwHR7WaUj
         iPQg==
X-Gm-Message-State: AOJu0YwaBcUxPATYmUyEPwXRCPDG2IfQ3BYaka6nES6HyXgsOTBQ3xek
	GvI1b3DlJhPwexRJR+poU3x2MkVjRA4aD9SD6xYZSw==
X-Google-Smtp-Source: AGHT+IHhj18itEgT7Zkm6inaHN3nE+QPEGLPicrIzqqx/vXBzW0adJyqRztqORI4Xy/4ylPWC4tCJ9Ht9cCQq18uOlw=
X-Received: by 2002:a25:aae3:0:b0:d1a:955f:304d with SMTP id
 t90-20020a25aae3000000b00d1a955f304dmr18305004ybi.64.1694070633444; Thu, 07
 Sep 2023 00:10:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-7-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-7-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 7 Sep 2023 09:10:22 +0200
Message-ID: <CACRpkdadcw=E38o=cNWT4fQ_PK0UPifJZdVjuXTw0cjxPAEaKw@mail.gmail.com>
Subject: Re: [PATCH 06/21] gpiolib: provide gpiod_to_device()
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
> struct gpio_desc is opaque so provide a way for users to retrieve the
> underlying GPIO device.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
