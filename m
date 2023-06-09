Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A5A182BE
	for <timestamp@lists.linux.dev>; Fri,  9 Jun 2023 15:13:43 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-777ac4344f9so78338539f.0
        for <timestamp@lists.linux.dev>; Fri, 09 Jun 2023 08:13:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686323622; x=1688915622;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SQR5X+cA13kUaYcqbqMobhb9VGgmIkohulmhqJZKYzY=;
        b=kjELtkfUMbOInkt1aT8d89RK2VRPaOUIrqtYkq8RkMtZvib7mOI6hcF806aPq7EdCG
         LDepi0Pe6ZRH/eQtLsPplQWoIQMI0UNCsZCT62Btm7F/X7aiXFkxtySbeWbaYAGoIyyP
         U25ayPqZ7F+FR1t9saNDDkBNllCz1SZttkm+3zOFdAW76DLGrlVx6v7Z5yfyVUxF5J/M
         EBKI0+wliWZdvAE0eVu9FnG20wn4WaNDtk1PtTnh5+RTeipmQQlWK/aNkw3P+6fyqtxu
         CgYo6i0wlUkRzxhC6dGZGnB0TXTLjkq5qIBz23Yf+8ylyuyTzSldzLTKEKnesfNe5cfa
         6bXA==
X-Gm-Message-State: AC+VfDyGzOxwl3UHFzaU9R40O196x9hmAGxMI4Obv1hDW0cLJh9fmXuN
	nD4L04QWWEGgXdKHyzwcNQ==
X-Google-Smtp-Source: ACHHUZ7pPsrApmh1g6QnAT5gDqfYy+vIK4VH1grPnXE4XcsiJ/FkZ0gxKjKu7YP4yiXH0oDQiYhlxA==
X-Received: by 2002:a05:6602:1851:b0:774:9af9:f45e with SMTP id d17-20020a056602185100b007749af9f45emr2002777ioi.11.1686323622392;
        Fri, 09 Jun 2023 08:13:42 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id p25-20020a02c819000000b0040fc56ad9fasm1000077jao.9.2023.06.09.08.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 08:13:41 -0700 (PDT)
Received: (nullmailer pid 1010803 invoked by uid 1000);
	Fri, 09 Jun 2023 15:13:39 -0000
Date: Fri, 9 Jun 2023 09:13:39 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Kishon Vijay Abraham I <kishon@kernel.org>, Mark Brown <broonie@kernel.org>, Dipen Patel <dipenp@nvidia.com>, linux-rtc@vger.kernel.org, Dilip Kota <eswara.kota@linux.intel.com>, alsa-devel@alsa-project.org, Guenter Roeck <linux@roeck-us.net>, Oleksij Rempel <o.rempel@pengutronix.de>, Alessandro Zummo <a.zummo@towertech.it>, linux-spi@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, devicetree@vger.kernel.org, linux-phy@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-watchdog@vger.kernel.org, Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>, Vinod Koul <vkoul@kernel.org>, linux-pwm@vger.kernel.org, timestamp@lists.linux.dev, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 4/7] dt-bindings: slimbus: restrict node name suffixes
Message-ID: <168632361891.1010750.17241199360005605438.robh@kernel.org>
References: <20230530144851.92059-1-krzysztof.kozlowski@linaro.org>
 <20230530144851.92059-5-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230530144851.92059-5-krzysztof.kozlowski@linaro.org>


On Tue, 30 May 2023 16:48:48 +0200, Krzysztof Kozlowski wrote:
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
>  Documentation/devicetree/bindings/slimbus/slimbus.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

