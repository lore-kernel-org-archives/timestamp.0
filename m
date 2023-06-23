Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7B08C02
	for <timestamp@lists.linux.dev>; Fri, 23 Jun 2023 14:51:54 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-31272fcedf6so723237f8f.2
        for <timestamp@lists.linux.dev>; Fri, 23 Jun 2023 07:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687531913; x=1690123913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rJWtnTqZGQqiTeKl4r3aFL4RAd0yKamdEh9nm3JU/uE=;
        b=nZcAJ+sOqOwPNZAQ60lFA97QCbjofCc+XbSeSieNhhuKrWMtiE/O020aJCaGZig5Lf
         M+2Ra8MPpBVqUhcStWmEYd2ObUzA+kQ3K8H2ePAsYG1JWTf3WWXWaROYVC6t7QX+mx6J
         ESspbYNZ8OxGO/MfZaT0ORXOyftuTisX0q5bz1doEqX176Xd3AyztjKHNHN63UimszRn
         Dqv+xetGcZd2+R0LFeA2aONQHwXzUPMXk9dRWS8mqvQ8vpJvPrOKCvsRr9lGz/T5jW+G
         bbfDKveX+aL7d/d/Okx6QglyYu1YT1lUbE8K9aKT4exUm3nUwLqWGufz9RjrDc1FYimv
         EUrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687531913; x=1690123913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rJWtnTqZGQqiTeKl4r3aFL4RAd0yKamdEh9nm3JU/uE=;
        b=DvawHl4y+DYinoz407X09IWD/AQyz86LQEd7NXHABzFCo4AtLXqyyqIu8edLe9ukz4
         ZV/jqp1bcXhX6RHCN997rtCmOlyFF8PD9/m2/3hUFYTb9SCZ/kH04ZxIIU4u1H3wmDCr
         bchjTp0argbbFBjKdEhvln0xz187AlFlAPMMjA6ch+G6rx+FUmYmWtf8UtATeUP0R6Wv
         d//kYO9USEtIDbsVYV1Fsz03+X/nDD2qpkWMWL9ny+kF/hyfKv75tovQtfEVj4FjG0PZ
         pYs2fsBlWqoPJwmf9vuTV6wRNOE6cpcOesxPLmhq2cwtVdb4qe5kPVC6e5bxar0nmvfC
         3bMQ==
X-Gm-Message-State: AC+VfDzIX0KIGwGjx28cCHKfRVFzXHbH+2h2+Dmcy9W2OSj2rf8WydIX
	Us57Uv3MSrBSdPoYq0hMgYU=
X-Google-Smtp-Source: ACHHUZ4EBaf4UIgKOYCqelucvQ5eoSxiLNvK3UwYGIN9g04VxMMagZ6W8cf/YKjEZ8A8mLc9ODWWzg==
X-Received: by 2002:a5d:5642:0:b0:311:13e6:6504 with SMTP id j2-20020a5d5642000000b0031113e66504mr14242204wrw.47.1687531913116;
        Fri, 23 Jun 2023 07:51:53 -0700 (PDT)
Received: from localhost (p200300e41f305300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f30:5300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id n11-20020a5d4c4b000000b003113ccbf388sm9844475wrt.13.2023.06.23.07.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 07:51:52 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Dipen Patel <dipenp@nvidia.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Dilip Kota <eswara.kota@linux.intel.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-spi@vger.kernel.org,
	timestamp@lists.linux.dev,
	linux-watchdog@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Tony Lindgren <tony@atomide.com>,
	Oleksij Rempel <linux@rempel-privat.de>
Subject: Re: (subset) [PATCH 0/7] dt-bindings: restrict node name suffixes
Date: Fri, 23 Jun 2023 16:51:36 +0200
Message-ID: <168753171977.1191890.3520383079920452323.b4-ty@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230530144851.92059-1-krzysztof.kozlowski@linaro.org>
References: <20230530144851.92059-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 30 May 2023 16:48:44 +0200, Krzysztof Kozlowski wrote:
> Tree-wide cleanup of DTS node name suffixes "-N", e.g. "pwm-5", so we allow
> only decimal numbers.  In few cases narrow the pattern to also disallow
> multiple suffixes, e.g. "pwm-5-5".
> 
> No dependencies, can be applied by individual subsystems.
> 
> Cc: Tony Lindgren <tony@atomide.com>
> Cc: Oleksij Rempel <o.rempel@pengutronix.de>
> 
> [...]

Applied, thanks!

[2/7] dt-bindings: pwm: restrict node name suffixes
      commit: 05b743db9d8cc4e51b3eb77889d24ab9aa2bf169

Best regards,
-- 
Thierry Reding <thierry.reding@gmail.com>
