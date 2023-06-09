Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93825256D
	for <timestamp@lists.linux.dev>; Fri,  9 Jun 2023 15:10:29 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-77807e43b7cso84807639f.1
        for <timestamp@lists.linux.dev>; Fri, 09 Jun 2023 08:10:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686323428; x=1688915428;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bgEA1Mw1A/5s3GKiOUjS2OVmsqKcYspaLT+4TG/YkK4=;
        b=O25uWzvOxsM2Km1imH/9aBl/HtYP1lbsGBhrJB24ycIJXvZXc0TyilBsA7pwhqnxiz
         Cr4PQgA+dF+533Cx4AsqAxHX+OFbwIP18vqz5yjPt9XTBT88RKTw+8iJG21Q0eiOwngC
         ChKlFIS0JmDf+mBnrwjcMFF9EVXfSj32fXTS6CJ2jH6g11PsnZdFLWeRm3trApAZPZ4f
         vlX6tVZSOE2kg0wxmCcwYv/2cUM9997tJVS1t6sjMyiVwYG6IdEb7cTPmBeXAe/MfQDO
         kVwBn3FgGfYXec6MsqOZYVGen/5zKLaiJveVnrGwGXxmSmnXvWT0+7rRr7DMFaKfu8Qk
         UtUA==
X-Gm-Message-State: AC+VfDwvBTgEIn7eINXHILvV60W2Jdn5i5w7zjBcqKmXBr1QqDjCfW8h
	wB2v+AYFEZHwb/r5p+ECtA==
X-Google-Smtp-Source: ACHHUZ6GLJF9xmiCznvrkvDAHStb1dFZWwEwBO0JSyNuKSB2A4EFN0t4aWuWCLrZCT/E+UeHUSc/ew==
X-Received: by 2002:a92:ce11:0:b0:33a:56d6:d9a4 with SMTP id b17-20020a92ce11000000b0033a56d6d9a4mr2155501ilo.10.1686323428407;
        Fri, 09 Jun 2023 08:10:28 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id l5-20020a92d8c5000000b00338a1272ce1sm1147336ilo.52.2023.06.09.08.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 08:10:27 -0700 (PDT)
Received: (nullmailer pid 986311 invoked by uid 1000);
	Fri, 09 Jun 2023 15:10:25 -0000
Date: Fri, 9 Jun 2023 09:10:25 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Mark Brown <broonie@kernel.org>, linux-watchdog@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>, linux-spi@vger.kernel.org, Tony Lindgren <tony@atomide.com>, Oleksij Rempel <o.rempel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-pwm@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Dipen Patel <dipenp@nvidia.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, alsa-devel@alsa-project.org, Kishon Vijay Abraham I <kishon@kernel.org>, Dilip Kota <eswara.kota@linux.intel.com>, Conor Dooley <conor+dt@kernel.org>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, linux-rtc@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, Thierry Reding <thierry.reding@gmail.com>, timestamp@lists.linux.dev
Subject: Re: [PATCH 1/7] dt-bindings: phy: intel,combo-phy: restrict node
 name suffixes
Message-ID: <168632342399.985906.12431431892707276555.robh@kernel.org>
References: <20230530144851.92059-1-krzysztof.kozlowski@linaro.org>
 <20230530144851.92059-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230530144851.92059-2-krzysztof.kozlowski@linaro.org>


On Tue, 30 May 2023 16:48:45 +0200, Krzysztof Kozlowski wrote:
> Make the pattern matching node names a bit stricter to improve DTS
> consistency.  The pattern is restricted to:
> 1. Only one unit address or one -N suffix,
> 2. -N suffixes to decimal numbers.
> 
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Cc: Tony Lindgren <tony@atomide.com>
> Cc: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/phy/intel,combo-phy.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

