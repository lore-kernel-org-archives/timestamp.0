Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD8114ABE
	for <timestamp@lists.linux.dev>; Fri, 30 Jun 2023 17:04:48 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-78654448524so25466439f.2
        for <timestamp@lists.linux.dev>; Fri, 30 Jun 2023 10:04:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688144688; x=1690736688;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bDSvITIumvxU+9FeXxHNbJLwhZGzlxTTZldXnMbbHIk=;
        b=BGdFR2bYIOTCsIqEuLmC+OPKTlcJf0EAu9+b9dXgF4KgXY0ECNcvV68ApmfRYo0Hmi
         hbWOwlwqrcgmP/nYTy84cnP5tr/HlQ09y8WCur4K5SH2x1tfenOkG5IoQgL8FLoQ+mOz
         aMK8ED3nyseSZSaq48Ftb3VItgsmr4mratGimjTAuDxKhBPoM1IEsTQhtXVTjHAQkixC
         O7wcZ9FOWArOZTOW1O6KKMlygwHjO5ZHJ7CyrN41Ma6PetADDg9ei200y/aK/8TpCj5d
         40589weihqo3M9wE4UyqtR8xnLjveKXvbT4QipT04N8XlT/UfTBwqKZLV1lns6w5bbmN
         9fTg==
X-Gm-Message-State: AC+VfDwNjQR/0vhNOkn1hqOrVfTyr4T48f23GT8VMUB0YwkXRH+2M5dv
	lMvhVZN3VwW4RU67evsDMQ==
X-Google-Smtp-Source: ACHHUZ7YVGW6lKVvg7C24o8CcDQqjgMElHyuoGKVnJCWvqYKZlQzdchG5JVGPC50uiHB8TDngxV6bA==
X-Received: by 2002:a05:6602:19d1:b0:783:5209:c01 with SMTP id ba17-20020a05660219d100b0078352090c01mr3305594iob.17.1688144687999;
        Fri, 30 Jun 2023 10:04:47 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id k5-20020a02cb45000000b0040bbcee6b57sm2373025jap.133.2023.06.30.10.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 10:04:47 -0700 (PDT)
Received: (nullmailer pid 1908824 invoked by uid 1000);
	Fri, 30 Jun 2023 17:04:44 -0000
Date: Fri, 30 Jun 2023 11:04:44 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Dipen Patel <dipenp@nvidia.com>, Tony Lindgren <tony@atomide.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Vinod Koul <vkoul@kernel.org>, Guenter Roeck <linux@roeck-us.net>, Alessandro Zummo <a.zummo@towertech.it>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, Dilip Kota <eswara.kota@linux.intel.com>, Mark Brown <broonie@kernel.org>, timestamp@lists.linux.dev, alsa-devel@alsa-project.org, linux-watchdog@vger.kernel.org, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, Thierry Reding <thierry.reding@gmail.com>, Oleksij Rempel <o.rempel@pengutronix.de>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, linux-phy@lists.infradead.org, linux-spi@vger.kernel.org, linux-rtc@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/7] dt-bindings: watchdog: restrict node name suffixes
Message-ID: <168814464489.1908194.10092224539849073775.robh@kernel.org>
References: <20230530144851.92059-1-krzysztof.kozlowski@linaro.org>
 <20230530144851.92059-8-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230530144851.92059-8-krzysztof.kozlowski@linaro.org>


On Tue, 30 May 2023 16:48:51 +0200, Krzysztof Kozlowski wrote:
> Make the pattern matching node names a bit stricter to improve DTS
> consistency.  The pattern is restricted to -N suffixes to decimal
> numbers.
> 
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Cc: Tony Lindgren <tony@atomide.com>
> Cc: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/watchdog/watchdog.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Seems watchdog patches aren't getting applied... Applied, thanks!

