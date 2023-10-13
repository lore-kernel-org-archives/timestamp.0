Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D846FB4
	for <timestamp@lists.linux.dev>; Fri, 13 Oct 2023 09:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xGUj4a+d"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-5a7af45084eso24515887b3.0
        for <timestamp@lists.linux.dev>; Fri, 13 Oct 2023 02:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697188931; x=1697793731; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F8SGxNakBdg/eVn7PIGX4hM/sVFT3VICvg5gS9TqXYU=;
        b=xGUj4a+dHPEVECacpkkA1A+7X6bM3PFM9SO1Ewx+aiAgj5YiC7iM24nX3Xqa8iXau6
         5fK5mTef1eppGTCzGkWJmx9LLlbdgtghbR2zr0HtRYx31Ot7GFtr3SquSb2N/Bwvg8fC
         wJ85Jp2LwHW/YVIlYESORwAS6eN4FN2Qc8Z5J26A7okugMmzOyhSJ+SnubVbRjDMZc32
         RmYYWm2Zi9CuwDNpWN4O00RZrZFfllio0ol6g0YzJDvpxgF+GreCBmAIROa4QwJYrJ1A
         YUYLsCNBKMVH8YveQk07v09XYM1G9fYQiD01ulhLejCl7BuaZBliz5wcWBCtXFxsXOB2
         R42A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697188931; x=1697793731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F8SGxNakBdg/eVn7PIGX4hM/sVFT3VICvg5gS9TqXYU=;
        b=MXIsPKn2ACFz/9TIPY7NNlJ91a5Ou+bl3ym7SYEXleTCiEBO8pPiDJYSOUxRdj5r/h
         qbx8qA7j7+4+6eF1s+19x9tI3xfKNIPaHsIIfb6mfLy/dJrL8/76pCPEPmjp8RqJ3MxP
         JOhpepZtGnwGSy3rczuG8D1ihXyRf9wG3O16vvgf/id/Bzf/K/p9xj+QIrd037OH7RD9
         CCMxiOyEClViefOit7ymIH8VuJEINt5Nnw3vRSzFTAIe/J2J6uIdQjwyS5INll5niZ5a
         LmSCF//iRS3xz/MG8Yi9b7dEHdnC4HKp+urEmAoaL8bCt00YrAR6kHPsmpUfq9M4wxB3
         EmjQ==
X-Gm-Message-State: AOJu0Yw+K7loalki8QpbqmoCEw4Xi9vi9VCKvFqdQkQhPlGI0ws2ITxs
	NL//VasGj20AEzmgHJjXTaXAY2QCCOw7HDClB9oW6w==
X-Google-Smtp-Source: AGHT+IEjUM6QSsdSZkuqSoUoeb4zdk5rMs26kzkqd85aMBvo/kCgSPeF7NujSuPVw/r4lCqKepQvz1vCuwu8uOhiG1s=
X-Received: by 2002:a81:a247:0:b0:599:b570:2db7 with SMTP id
 z7-20020a81a247000000b00599b5702db7mr26076473ywg.30.1697188931174; Fri, 13
 Oct 2023 02:22:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231010151709.4104747-1-andriy.shevchenko@linux.intel.com> <20231010151709.4104747-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20231010151709.4104747-2-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 13 Oct 2023 11:21:59 +0200
Message-ID: <CACRpkdaPfBBW4a-AQZs21J=CCwMVNSdzBicu5CTS4xzT2=Qmiw@mail.gmail.com>
Subject: Re: [PATCH v1 1/4] gpiolib: provide gpio_device_find_by_fwnode()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Dipen Patel <dipenp@nvidia.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	timestamp@lists.linux.dev, linux-tegra@vger.kernel.org, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 10, 2023 at 5:18=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:


> One of the ways of looking up GPIO devices is using their fwnode.
> Provide a helper for that to avoid every user implementing their
> own matching function.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

This makes sense to me! (But I haven't looked at the rest of the
patches in the series. Yet.)
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
