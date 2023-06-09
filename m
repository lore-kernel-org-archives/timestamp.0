Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02307256D
	for <timestamp@lists.linux.dev>; Fri,  9 Jun 2023 15:14:25 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-777a4926555so61145839f.0
        for <timestamp@lists.linux.dev>; Fri, 09 Jun 2023 08:14:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686323665; x=1688915665;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EkAejDhVenOljts+lEgATyY0mjLSL4+xG2fSzob05cU=;
        b=JXjKm7OuFck8doCGMOwdANyWkP7bUqIawAjpHb0Iyb5/5GeY9OTSmykXJRtxRMV5rW
         oeq8SemsUEd98xmUBnCXvzLLa6R8HTht+Ca4ghLW7EqeDwiw9tEIfwqQ70lOxIXw0eOS
         Clhaj+ikXBVeMFHn9atE6t3/aPJxbTIjTauOo9P/kbjkyCA2lIS2bkNTHJL6nQcqBnfB
         lpg6H9MyNUoMqf5nR7Pj6v/T1+2cjpvUR5PznU2Lb+/2XqF1CVMPA1S/3TKFf7veBB3x
         3ZJMjBA8nMJoDRfj5Q5p4ijgxuM3wsrAAoK0CK7MuZ5+Xr76LMjLiyCGaGfLfpl0N4Q9
         Mu2w==
X-Gm-Message-State: AC+VfDwa5VLARYQoAdge4s205k0ixH6wsnP82Vo2nDS49eqYPPK50pAK
	RWylicgiyCxcjQY+miY/YA==
X-Google-Smtp-Source: ACHHUZ51hC0FqW26G3ZZ/1x1kW04DJ7QhraHlAzn2ctcSO3HfuegS6P1MdA5ofiYZJ2F6gytcZ0bbw==
X-Received: by 2002:a5d:8b5a:0:b0:774:8d6c:9fe7 with SMTP id c26-20020a5d8b5a000000b007748d6c9fe7mr3269252iot.3.1686323664873;
        Fri, 09 Jun 2023 08:14:24 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id eq14-20020a0566384e2e00b0041631393ac9sm1026218jab.18.2023.06.09.08.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 08:14:24 -0700 (PDT)
Received: (nullmailer pid 1011643 invoked by uid 1000);
	Fri, 09 Jun 2023 15:14:20 -0000
Date: Fri, 9 Jun 2023 09:14:20 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-spi@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>, Vinod Koul <vkoul@kernel.org>, linux-kernel@vger.kernel.org, Dilip Kota <eswara.kota@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org, linux-pwm@vger.kernel.org, linux-watchdog@vger.kernel.org, timestamp@lists.linux.dev, Tony Lindgren <tony@atomide.com>, Kishon Vijay Abraham I <kishon@kernel.org>, devicetree@vger.kernel.org, linux-rtc@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-phy@lists.infradead.org, Wim Van Sebroeck <wim@linux-watchdog.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Oleksij Rempel <o.rempel@pengutronix.de>, Dipen Patel <dipenp@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 7/7] dt-bindings: watchdog: restrict node name suffixes
Message-ID: <168632366012.1011592.9711699530759737056.robh@kernel.org>
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

Acked-by: Rob Herring <robh@kernel.org>

