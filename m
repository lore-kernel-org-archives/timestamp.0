Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84DB1A23A6
	for <timestamp@lists.linux.dev>; Thu,  6 Feb 2025 18:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738865840; cv=none; b=Xii6eeYPkj5z1524gsQCjmdqshch+63pWdAaHzHLxkSnuRIWQJ72M1cyb3Dvsfrs2A6QnemxxmESeySLSAWuGKES/Ybf3RECK5GkbJnVkSDahgXcHuPGk3Jh+V0SWipCHbtBq+0QxisfFlzPiXWj2eth/V2iaAPiYMt7Xx4gR8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738865840; c=relaxed/simple;
	bh=197lp3kzwItmnztsj2amEy4Ts4sUwvD5wd25DtZFya8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oecX7rYiJAiM+Rrd0SL+M1BbCWiqtMDW5Wn5cLvfQqgP9SaLH2lDKtfuJqfi0du/F/c9P901J7v+jhknTNkh+lWLVpi4/CjfoiPZOea9cp/v4kTYDqmrGirxf7UATvOvDd3Z+wZpR4fQUxlwU88UjfFOj1InLlr4GK0xuGIJtXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wedrztEr; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wedrztEr"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5439e331cceso1519459e87.1
        for <timestamp@lists.linux.dev>; Thu, 06 Feb 2025 10:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738865837; x=1739470637; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5MVWUvrz6I/EjcUog/wJCigSBALMduOPBpWQgvDyB4o=;
        b=wedrztEroiYbqD3T3WGUqh7qKPKEU4qOmQn7MSXRGJa2n/NRe51J+5vMXGffYlmpMT
         LcOo98EJVPVtjiNbpf9wV5QY5/As4tBY5SpCdNLpuIDjYgiXz8iTjMByF/XjQYw7obmk
         +CgyzSAElqEsYbE8NeGnx1wT1Y6lpvEprjvBOIwW7LFulzGEZ+M4xNIdsDeupfYCEzcT
         33rsTNUF8vPFxXd9jwYBAvwA5BTQ0Rd3oDp/S+Jb3HNLKz7d/xuHRFcrww5fkBJQuY7P
         1+9jkJ1JY3UrPN6uMBvI511nVH1XTl6qrUQELnLR4dcdsnhDw6pmiM/4Pu2eLnTzz6OQ
         wlIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738865837; x=1739470637;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5MVWUvrz6I/EjcUog/wJCigSBALMduOPBpWQgvDyB4o=;
        b=MRMTBsgQD2SJOglqeKeZ3JNx9tMj/ebeyV/j0L57OdU7JGsth3yAy31kMMakOWnqjN
         Api7Gl3YCJbR63fStGp1+IpojpcR/tGG/n0WhnAx0Ny2TH9KEyI6liu4hkPDS37EnRh+
         4RYAKAKJN56U7Vk39sCmujv0cJOwc5pw3p1Es7LrUAUQFthClDyujLIfC1+HPlyrBOTZ
         1GRYytYzqMuBpYqttzLWllY8iNJeg1aMUC+zRweV+ojeWnOZKY80D26zod0HxhYKJ+Xb
         M6Twb4n5b9Jp2eapx4I/1IALN3Z7jqmkIWnhD3QnT6PHXGAyiIkdMGhE8A7UUJ6z3blz
         49NA==
X-Forwarded-Encrypted: i=1; AJvYcCVxsME+CmFLJptanh2FlvuTFkAa6aRQrwciONkoNXohOKJO/b/nxNQ+2dL2e+3CF5n9VEzQ9kr3keM=@lists.linux.dev
X-Gm-Message-State: AOJu0YwOqdYA2+SwaRLPV+0oga0clDsT56O3VRUjNHmiERVhCut4D2zB
	OBVLtMTRCbCR1MPdcBGCiWA/CSh1zcgiI6ZbQbRS9XTQkf0n0Jfel8jEKp2+/kZePRbxsPu2P7E
	TL09VvLQHgYNWaOdooGklsxLvB59KW+FSMaZYgw==
X-Gm-Gg: ASbGncu5EnLuNt0xE5RYPqsxYvf8ThlDPpmCWQwXHZN6fB49KEfMdwcabkPBwrZwEBH
	LxdMbp8w1d+MHrXpsjJoPwMaVJyNEMEJu8tzKNyf/EvZHjMpMUuOf7ZVbHMFMcwhDhZtOIJE=
X-Google-Smtp-Source: AGHT+IH3sHYKWyOD5ia3rmPaUPdB8KYuQwRoGoxGcTpzNmXeS5xrmV3mgCN6Tr2QiY+B044QqFQhDWxhGS1tixCTg/o=
X-Received: by 2002:a05:6512:1044:b0:540:1d37:e6e with SMTP id
 2adb3069b0e04-54405a438a5mr3117203e87.33.1738865836820; Thu, 06 Feb 2025
 10:17:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250206143714.182230-1-brgl@bgdev.pl>
In-Reply-To: <20250206143714.182230-1-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 6 Feb 2025 19:17:05 +0100
X-Gm-Features: AWEUYZmjY00VQRyj-wROvCwcjvRKMHYs9Ew0heG6nw4BijJkAe4FJsZiQNQlpkw
Message-ID: <CACRpkdYKY-fZED=ZCjuXD5s0TYYxBsgFwJ2ga-rHkx4k6FE5Bg@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: don't build HTE code with CONFIG_HTE disabled
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Dipen Patel <dipenp@nvidia.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, timestamp@lists.linux.dev, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bartosz,

On Thu, Feb 6, 2025 at 3:37=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Hardware timestamping is only used on tegra186 platforms but we include
> the code and export the symbols everywhere. Shrink the binary a bit by
> compiling the relevant functions conditionally.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

> +static inline int gpiod_enable_hw_timestamp_ns(struct gpio_desc *desc,
> +                                              unsigned long flags)
> +{
> +#if !IS_ENABLED(CONFIG_GPIOLIB)
> +       WARN_ON(desc);
> +#endif
> +       return -ENOSYS;

I think you can just:

if (!IS_ENABLED(CONFIG_GPIOLIB))
  WARN_ON()
else
  return -ENOSYS;

here, so it's not so ifdeffy.
The compiler will eliminate the second branch.

Yours,
Linus Walleij
