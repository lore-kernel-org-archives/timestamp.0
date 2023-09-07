Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02FD9136B
	for <timestamp@lists.linux.dev>; Thu,  7 Sep 2023 07:22:55 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-d7eccc1b8c6so626535276.0
        for <timestamp@lists.linux.dev>; Thu, 07 Sep 2023 00:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694071374; x=1694676174; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KDyS14lOc9gIdV8qqpJN7dVOi7FiXE2O1crBwgTrNhg=;
        b=hWJC0diW82VCKEXjRzALnvAbWETOnOmwwIQCbF4bFPpkswpWOFzJzzRa+drXYx3vJE
         drfwpK5BCAi0O1EV3ORXO1HM6IacSNYeth4hDn6ZQBR+ihX4u+x7g7dzqVY19OnlY0TP
         WQRURMEwbf4Cm9y9/6X+BofxZBR/RFjI37PwHGf0cUDm9PuQTTE/tIbgdDYo261jhCI7
         FPZK3eDBzUnT6b+W5ufUnvV21CsrypOBlT68R1XlSi7gVK4OnIA1Zkwa7n3Y9T5VYJj5
         6DEpda2co1DxTrtdeMnxiXyknHqsLeWYYhr4GjJbuGFobKTpYUT00o8BoRmZL0iu6HhF
         7JMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694071374; x=1694676174;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KDyS14lOc9gIdV8qqpJN7dVOi7FiXE2O1crBwgTrNhg=;
        b=X55CRXzz5Mxmuuev/S14kdqeZr4TbXjqdP3rl8UzXKssyh4U39QnpQy61MChkLbsXa
         v0Jnt8Q/fLcBEt0EDkNdn3OOEB498Hlqf6eZ7ntcJeA7lqevhd8OQ0Vzzru6ld5s5dn+
         b+z2mpT/j9K7nx/Tr6UC/qmnZRNhLU/JVjQdjFaVKnV+g33wcnRzaJlKEkFLLztR51S0
         D62jRG0Yzpg6I5zXysvGssq+uDOMJl6am9Z+CmK9OGlcTpBOqOOrOLcxJTe8ISVByIeF
         4tiqkQ7Y1Fynj6Ve8I1hipWDRf7dUOn96yYis0V7DKc+LsCbHatwOPTUJqFt6w3H4HsF
         2EfQ==
X-Gm-Message-State: AOJu0YxGBngytUiyQdVHY+Xl4sp8wpjrFocPb92dTrQnsdA/4GfksSu9
	Qf/bC4EP5dOgB3TrK4e5e8pXD+2a2GV5jfzl3n54tQ==
X-Google-Smtp-Source: AGHT+IGJ2fOJYbfgZwCYkGOqpBoV8zRdwms0YQyjwmM812KoO4CG3kmEhKK7s/PjKGQeVe41+y3pVjBhSp9/fdWja/U=
X-Received: by 2002:a25:408a:0:b0:d06:49e9:a29c with SMTP id
 n132-20020a25408a000000b00d0649e9a29cmr19754022yba.34.1694071374753; Thu, 07
 Sep 2023 00:22:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-13-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-13-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 7 Sep 2023 09:22:43 +0200
Message-ID: <CACRpkdYJhP5otaFXbn49sK_33GJMy85MszyD9rqoQT1-fqd9dA@mail.gmail.com>
Subject: Re: [PATCH 12/21] hte: allow building modules with COMPILE_TEST enabled
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
> Allow building all HTE modules with COMPILE_TEST Kconfig option enabled.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This should be a separate patch should it not?
Just send it separately to Dipen so he can merge it.
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
